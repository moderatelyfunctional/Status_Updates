//
//  WeatherView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PageView: NSView {

    let summary = PageField(frame: NSRect(x: 20, y: 5, width: 450, height: 20))
    
    init(page: PageData) {
        super.init(frame: NSRect(x: 0, y: 0, width: 450, height: 30))
        
        self.summary.stringValue = page.name
        
        self.layer?.backgroundColor = NSColor.blue.cgColor
        self.addSubview(self.summary)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
