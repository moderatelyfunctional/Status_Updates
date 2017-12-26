//
//  WeatherItem.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PageField: NSTextField {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.isSelectable = false
        self.isBordered = false
        self.backgroundColor = NSColor.clear
        self.font = NSFont(name: "Helvetica Neue", size: 14)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
