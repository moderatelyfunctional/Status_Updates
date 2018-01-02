//
//  WeatherView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PageView: NSView {
    
    let name = TextLabel(frame: NSRect(x: Cons.PageView.offsetX,
                                       y: Cons.PageView.nameY,
                                       width: Cons.PageView.width - Cons.PageView.offsetX,
                                       height: Cons.PageView.nameHeight))
    let likes = TextLabel(frame: NSRect(x: Cons.PageView.offsetX,
                                        y: Cons.PageView.likesY,
                                        width: Cons.PageView.width - Cons.PageView.offsetX,
                                        height: Cons.PageView.nameHeight),
                          fontSize: 13.0)
    let nPosts = TextLabel(frame: NSRect(x: Cons.PageView.offsetX,
                                         y: Cons.PageView.postsY,
                                         width: Cons.PageView.width - Cons.PageView.offsetX,
                                         height: Cons.PageView.nameHeight),
                           fontSize: 13.0)
    let updated = TextLabel(frame: NSRect(x: Cons.PageView.offsetX,
                                          y: Cons.PageView.updatedY,
                                          width: Cons.PageView.width - Cons.PageView.offsetX,
                                          height: Cons.PageView.nameHeight),
                            fontSize: 13.0)
    
    init(page: PageData) {
        super.init(frame: NSRect(x: 0, y: 0, width: Cons.PageView.width, height: Cons.PageView.height))
        
        let hoursAgo = -1 * Date.hoursPrior(currDate: page.updated)
        
        self.name.stringValue = page.name
        self.likes.stringValue = "\(page.likes) Likes"
        self.nPosts.stringValue = "\(page.nPosts) Posts within 24h"
        self.updated.stringValue = "Last posted \(hoursAgo)h ago"
        
        self.addSubview(self.name)
        self.addSubview(self.likes)
        self.addSubview(self.nPosts)
        self.addSubview(self.updated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
