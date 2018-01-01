//
//  TextInput.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/30/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class TextInput: NSTextField {

    init(frame: CGRect, fontSize: CGFloat) {
        super.init(frame: frame)
        
        self.isEditable = true
        self.lineBreakMode = .byTruncatingTail
        self.placeholderString = Cons.PrefAccessInput.placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
