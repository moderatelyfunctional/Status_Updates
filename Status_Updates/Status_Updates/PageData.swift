//
//  PageData.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

struct PageData {
    let name:String
    let likes:Int
    let updated:NSDate
    let nPosts:Int
}

let EmptyPageData = PageData(name: "", likes: 0, updated: NSDate(), nPosts: 0)
