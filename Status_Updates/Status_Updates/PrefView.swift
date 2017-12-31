//
//  PrefView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/27/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PrefView: NSTextField {
    
    init(frame: CGRect, fontSize: CGFloat, text: String) {
        super.init(frame: frame)
        
        self.isEditable = true
        self.drawsBackground = false
        self.stringValue = text
        
        self.isBordered = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
