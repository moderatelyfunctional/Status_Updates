//
//  PrefScroller.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/30/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PrefScroller: NSScrollView {
    
    let prefTableView = PreferencesTableView(currentData: PageList.sharedInstance.data)
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        
        self.drawsBackground = false
        self.hasVerticalScroller = false
        self.documentView = prefTableView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
