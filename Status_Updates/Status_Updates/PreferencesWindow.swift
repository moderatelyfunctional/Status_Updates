//
//  PreferencesWindow.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PreferencesWindow: NSWindowController {
    
    let fb_access = TextLabel(frame: Cons.PrefAccess.frame,
                              fontSize: Cons.PrefAccess.fontSize)
    let fb_access_input = TextInput(frame: Cons.PrefAccessInput.frame,
                                    fontSize: Cons.PrefAccessInput.fontSize)
    let fb_button = PrefButton(frame: Cons.PrefButton.frame)
    let first_separator = NSBox(frame: Cons.PrefSeparators.first)
    
    let fb_pages = PrefScroller(frame: Cons.PrefScroller.frame)
    
    init() {
        super.init(window: NSWindow(contentRect: NSRect(x: 0, y: 0, width: 400, height: 600),
                                    styleMask: .docModalWindow,
                                    backing: .nonretained,
                                    defer: false))
        
        self.fb_access.stringValue = Cons.PrefAccess.text
        self.first_separator.boxType = .primary
        
        self.window?.title = "Preferences"
        self.window?.styleMask = [.titled, .closable]
        self.window?.center()
        
        self.window?.contentView?.addSubview(self.fb_access)
        self.window?.contentView?.addSubview(self.fb_access_input)
        self.window?.contentView?.addSubview(self.fb_button)
        self.window?.contentView?.addSubview(self.first_separator)
        self.window?.contentView?.addSubview(self.fb_pages)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
