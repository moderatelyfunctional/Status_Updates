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
                                       y: Cons.PageView.offsetY,
                                       width: Cons.PageView.width - Cons.PageView.offsetX,
                                       height: Cons.PageView.nameHeight))
    
    
    init(page: PageData) {
        super.init(frame: NSRect(x: 0, y: 0, width: Cons.PageView.width, height: Cons.PageView.height))
        
        self.summary.stringValue = page.name
        self.layer?.backgroundColor = NSColor.clear.cgColor
        
        self.addSubview(self.summary)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
