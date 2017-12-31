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
    
    private init() {
//        self.data = PageList.fetchData(pages: ["beaverconfessions", "timelybeaverconfessions", "overheardatmit", "TheMITOnion"])
    }

    static func fetchData(pages: [String]) -> [PageData] {
        if (FBPageAPI.sharedInstance.ACCESS_TOKEN.isEmpty) {
            return []
        }
        
        var pageDataList = [PageData]()
        let group = DispatchGroup()
        
        for page in pages {
            group.enter()
            DispatchQueue.global().async {
                FBPageAPI.sharedInstance.fetchPage(page) { pageData in
                    pageDataList.append(pageData)
                    group.leave()
                }
            }
            group.wait()
        }
        
        return pageDataList
    }
}
