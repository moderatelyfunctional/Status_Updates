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

func compactPageData(pageData: PageData) -> String {
    let id_end = pageData.id.characters.count
    let name_end = id_end + pageData.name.characters.count
    let likes_end = name_end + pageData.likes.numDigits
    let update_end = likes_end + pageData.updated.description.characters.count
    let nPosts_end = update_end + pageData.nPosts.numDigits
    let compactData = "\(pageData.id)\(pageData.name)\(pageData.likes)\(pageData.updated)\(pageData.nPosts)"
    
    return "\(id_end):\(name_end):\(likes_end):\(update_end):\(nPosts_end):\(compactData)"
}
