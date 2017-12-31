//
//  PrefControl.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/30/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PrefControl: NSSegmentedControl {

    override init(frame: NSRect) {
        super.init(frame: frame)
        
        self.segmentCount = 2
        self.segmentStyle = .smallSquare
        self.trackingMode = .momentary
        
        self.setWidth(32, forSegment: 0)
        self.setWidth(32, forSegment: 1)
        
        self.setImage(NSImage(named: NSImageNameAddTemplate), forSegment: 0)
        self.setImage(NSImage(named: NSImageNameRemoveTemplate), forSegment: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
