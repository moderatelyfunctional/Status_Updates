//
//  PageList.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Foundation

final class PageList {
    
    static let sharedInstance = PageList()
    var data = [PageData]()
    var pageids = [String]()
    
    private init() {
        if let pageList = UserDefaults.standard.object(forKey: "FB_PAGE_LIST") {
            self.pageids = pageList as! [String]
        }
        if let pageDataList = UserDefaults.standard.object(forKey: "FB_PAGE_DATA_LIST") {
            let pageDataStringList = pageDataList as! [String]
            for pageDataString in pageDataStringList {
                self.data.append(pageDataFromString(pageString: pageDataString))
            }
        }
    }

    static func fetchData() -> [PageData] {
        if (FBPageAPI.sharedInstance.ACCESS_TOKEN.isEmpty) {
            return []
        }
        
        var pageDataList = [PageData]()
        let group = DispatchGroup()
        
        for page in PageList.sharedInstance.pageids {
            group.enter()
            DispatchQueue.global().async {
                FBPageAPI.sharedInstance.fetchPage(page) { _, pageData in
                    pageDataList.append(pageData)
                    group.leave()
                }
            }
            group.wait()
        }
        
        return pageDataList
    }
}
