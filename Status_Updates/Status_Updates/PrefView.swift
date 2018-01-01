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
    let prefDelegate:PrefFBPageDelegate
    
    init(frame: CGRect, text: String, row:Int, editable: Bool, delegate:PrefFBPageDelegate) {
        self.row = row
        self.prefDelegate = delegate
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
        if (self.stringValue == "") {
            return
        }
        self.prefDelegate.insertRow(row: self.row, id: self.stringValue)
    }
}
