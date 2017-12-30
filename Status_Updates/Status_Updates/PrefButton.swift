//
//  PrefButton.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/30/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PrefButton: NSButton {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
//        let cell = NSButtonCell(textCell: "Set")
        self.cell = cell
        
        self.title = "Set"
//        self.bezelStyle = .roundbe
        self.setButtonType(.momentaryPushIn)
        self.bezelStyle = .rounded
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
