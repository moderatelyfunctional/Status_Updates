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
    var updated:Date
    var nPosts:Int
}

let EmptyPageData = PageData(id: "", name: "", likes: 0, updated: Date(), nPosts: 0)

func compactPageData(pageData: PageData) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd-yyyy HH:mm"
    
    let dateString = formatter.string(from: pageData.updated)
    
    let id_end = pageData.id.characters.count
    let name_end = id_end + pageData.name.characters.count
    let likes_end = name_end + pageData.likes.numDigits
    let update_end = likes_end + dateString.description.characters.count
    let nPosts_end = update_end + pageData.nPosts.numDigits
    let compactData = "\(pageData.id)\(pageData.name)\(pageData.likes)\(dateString)\(pageData.nPosts)"
    
    return "\(id_end):\(name_end):\(likes_end):\(update_end):\(nPosts_end):\(compactData)"
}

func pageDataFromString(pageString: String) -> PageData {
    var page = EmptyPageData
    
    let componentsArr = pageString.components(separatedBy: ":")
    let id_index = Int(componentsArr[0])!
    let name_index = Int(componentsArr[1])!
    let likes_index = Int(componentsArr[2])!
    let update_index = Int(componentsArr[3])!
    let posts_index = Int(componentsArr[4])!
    
    let pageData = componentsArr[5...componentsArr.count - 1].joined(separator: ":")
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
    
    page.id = pageData.substring(with: 0..<id_index)
    page.name = pageData.substring(with: id_index..<name_index)
    page.likes = Int(pageData.substring(with: name_index..<likes_index))!
    page.updated = dateFormatter.date(from: pageData.substring(with: likes_index..<update_index))!
    page.nPosts = Int(pageData.substring(with: update_index..<posts_index))!
    
    return page
}




