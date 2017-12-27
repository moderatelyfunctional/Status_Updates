//
//  WeatherView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PageView: NSView {

    let summary = PageField(frame: NSRect(x: 20, y: 5, width: 180, height: 100))
    
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 200, height: 100))
        
        self.summary.stringValue = "Updates"
        
        self.layer?.backgroundColor = NSColor.blue.cgColor
        self.addSubview(self.summary)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
