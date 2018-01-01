//
//  PageData.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

struct PageData {
    var id:String
    var name:String
    var likes:Int
    var updated:NSDate
    var nPosts:Int
}

let EmptyPageData = PageData(id: "", name: "", likes: 0, updated: NSDate(), nPosts: 0)
