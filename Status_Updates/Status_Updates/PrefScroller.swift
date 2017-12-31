//
//  PrefScroller.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/30/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PrefScroller: NSScrollView {
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        
        self.drawsBackground = false
        self.hasVerticalScroller = true
        self.documentView = PreferencesTableView(currentData: PageList.sharedInstance.data)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
