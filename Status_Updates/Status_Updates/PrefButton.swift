//
//  PrefButton.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/30/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PrefButton: NSButton {

    init(frame frameRect: NSRect, title: String) {
        super.init(frame: frameRect)
        
        self.title = title
        self.setButtonType(.momentaryPushIn)
        self.bezelStyle = .texturedSquare
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
