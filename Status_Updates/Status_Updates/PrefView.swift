//
//  PrefView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/27/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PrefView: NSTextField, NSTextFieldDelegate {
    
    let row:Int
    
    init(frame: CGRect, fontSize: CGFloat, text: String, row:Int, editable: Bool) {
        self.row = row
        super.init(frame: frame)
        
        self.isEditable = editable
        self.drawsBackground = false
        self.isBordered = false
        self.stringValue = text
        
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func controlTextDidEndEditing(_ obj: Notification) {
        
    }
}
