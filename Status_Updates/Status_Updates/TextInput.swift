//
//  TextInput.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/30/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class TextInput: NSTextField, NSTextFieldDelegate {

    init(frame: CGRect, fontSize: CGFloat) {
        super.init(frame: frame)
        
        self.isEditable = true
        self.placeholderString = Cons.PrefAccessInput.placeholder
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
//        
//        return true
//    }
    
}
