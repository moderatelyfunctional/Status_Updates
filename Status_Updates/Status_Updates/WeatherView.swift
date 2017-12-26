//
//  WeatherView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class WeatherView: NSView {
    
    let city = WeatherField(frame: NSRect(x: 20, y: 27, width: 180, height: 20))
    let currentConditions = WeatherField(frame: NSRect(x: 20, y: 5, width: 180, height: 20))
    
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 200, height: 47))
        
        self.city.stringValue = "Boston"
        self.currentConditions.stringValue = "22.4F Cloudy"
        
        self.addSubview(self.city)
        self.addSubview(self.currentConditions)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
