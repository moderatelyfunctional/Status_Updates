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
}
