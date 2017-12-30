//
//  PreferencesWindow.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PreferencesWindow: NSWindowController {
    
//    let preferencesTableView = PreferencesTableView()
    let fb_access = TextLabel(frame: Cons.PrefAccess.frame,
                              fontSize: Cons.PrefAccess.fontSize)
    let fb_access_input = TextInput(frame: Cons.PrefAccessInput.frame,
                                    fontSize: Cons.PrefAccessInput.fontSize)
    let fb_button = PrefButton(frame: Cons.PrefButton.frame)
    
    init() {
        super.init(window: NSWindow(contentRect: NSRect(x: 0, y: 0, width: 400, height: 600),
                                    styleMask: .docModalWindow,
                                    backing: .nonretained,
                                    defer: false))
        
        self.fb_access.stringValue = Cons.PrefAccess.text
        
        self.window?.title = "Preferences"
        self.window?.styleMask = [.titled, .closable]
        self.window?.center()

//        let prefScroller = NSScrollView(frame: NSRect(x: Cons.PrefTableView.offsetX,
//                                                      y: Cons.PrefTableView.offsetY,
//                                                      width: Cons.PrefTableView.width,
//                                                      height: Cons.PrefTableView.height))
//        prefScroller.hasVerticalScroller = true
//        prefScroller.documentView = self.preferencesTableView
//        prefScroller.backgroundColor = NSColor.white
//        prefScroller.drawsBackground = true
//        self.window?.contentView?.addSubview(prefScroller)
        self.window?.contentView?.addSubview(self.fb_access)
        self.window?.contentView?.addSubview(self.fb_access_input)
        self.window?.contentView?.addSubview(self.fb_button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
