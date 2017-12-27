//
//  PreferencesWindow.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PreferencesWindow: NSWindowController {
    
    let preferencesTableView = PreferencesTableView()
    
    init() {
        super.init(window: NSWindow(contentRect: NSRect(x: 0, y: 0, width: 400, height: 600),
                                    styleMask: .docModalWindow,
                                    backing: .nonretained,
                                    defer: false))

        self.window?.title = "Preferences"
        self.window?.styleMask = [.titled, .closable]
        self.window?.center()

        self.window?.contentView?.addSubview(self.preferencesTableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
