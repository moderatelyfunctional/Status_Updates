//
//  WeatherView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class WeatherView: NSView {
    
    let city = NSTextField(frame: NSRect(x: 20, y: 0, width: 180, height: 20))
    
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 200, height: 90))
        
        self.city.stringValue = "Quit"
        self.city.isBordered = false
        self.city.font = NSFont(name: "Helvetica Neue", size: 14)
        self.city.backgroundColor = NSColor.clear
        
        self.addSubview(self.city)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
