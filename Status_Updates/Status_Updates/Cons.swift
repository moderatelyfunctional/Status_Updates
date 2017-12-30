//
//  Cons.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//
import Foundation

struct Cons {
    struct PageView {
        static let width:CGFloat = 200.0
        static let height:CGFloat = 110
        static let offsetX:CGFloat = 20.0
        static let offsetY:CGFloat = 5.0
        static let separator:CGFloat = 1.0
        
        static let nameHeight:CGFloat = 20.0
        static let nameY:CGFloat = Cons.PageView.height - Cons.PageView.offsetY - Cons.PageView.nameHeight
        
        static let likesY:CGFloat = Cons.PageView.nameY - Cons.PageView.nameHeight
        
        static let postsY:CGFloat = Cons.PageView.likesY - Cons.PageView.nameHeight - 9 * Cons.PageView.separator
        
        static let updatedY:CGFloat = Cons.PageView.postsY - Cons.PageView.nameHeight
    }
    struct PrefWindow {
        static let width:CGFloat = 400.0
        static let height:CGFloat = 600
    }
    struct PrefTableView {
        static let width:CGFloat = 360
        static let height:CGFloat = 200
        static let separator:CGFloat = 15
        
        static let offsetX:CGFloat = (Cons.PrefWindow.width - Cons.PrefTableView.width) / 2
//        static let offsetY:CGFloat = Cons.PrefWindow.height - Cons.PrefTableView.height - Cons.PrefTableView.separator
        static let offsetY:CGFloat = 80
    }
    struct PrefView {
        static let nRows:Int = 10
        static let width:CGFloat = 360
        static let height:CGFloat = 20
    }
    struct PrefAccess {
        static let offsetX:CGFloat = 20
        static let offsetY:CGFloat = PrefWindow.height - 60
        static let text:String = "FB_ACCESS_KEY :"
        static let width:CGFloat = Cons.PrefAccess.text.width(fontSize: PrefAccess.fontSize)
        static let height:CGFloat = 20
        
        static let fontSize:CGFloat = 12.0
    }
    struct PrefAccessInput {
        static let offsetX:CGFloat = Cons.PrefAccess.offsetX + Cons.PrefAccess.width + 5
        static let offsetY:CGFloat = Cons.PrefAccess.offsetY
        static let placeholder:String = "Insert Facebook API Key"
        static let width:CGFloat = Cons.PrefAccessInput.placeholder.width(fontSize: PrefAccessInput.fontSize) + 10
        static let height:CGFloat = Cons.PrefAccess.height
        
        static let fontSize:CGFloat = 12.0
        
    }
}














