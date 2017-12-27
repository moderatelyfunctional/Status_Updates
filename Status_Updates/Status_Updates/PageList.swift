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
    
    let data = [PageData(name: "MIT Confessions",
                         likes: 18940,
                         updated: NSDate(timeIntervalSinceNow: TimeInterval(exactly: 2400.0)!),
                         nPosts: 4),
                PageData(name: "Overheard At MIT",
                         likes: 2242,
                         updated: NSDate(timeIntervalSinceNow: TimeInterval(exactly: 11000.0)!),
                         nPosts: 10),
                PageData(name: "MIT Onion",
                         likes: 18940,
                         updated: NSDate(timeIntervalSinceNow: TimeInterval(exactly: 3720.0)!),
                         nPosts: 0)
    ]
    
    private init() {
        
    }
    
}
