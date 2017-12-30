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
    let fb_access = TextLabel(frame: NSRect(x: Cons.PrefAccess.offsetX,
                                            y: Cons.PrefAccess.offsetY,
                                            width: Cons.PrefAccess.width,
                                            height: Cons.PrefAccess.height),
                              fontSize: Cons.PrefAccess.fontSize)
    let fb_access_input = TextInput(frame: NSRect(x: Cons.PrefAccessInput.offsetX,
                                                  y: Cons.PrefAccessInput.offsetY,
                                                  width: Cons.PrefAccessInput.width,
                                                  height: Cons.PrefAccessInput.height),
                                    fontSize: Cons.PrefAccessInput.fontSize)
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
