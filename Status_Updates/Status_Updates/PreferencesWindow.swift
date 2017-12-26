//
//  PreferencesWindow.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PreferencesWindow: NSWindowController {

    override var windowNibName: String! {
        return "PreferencesWindow"
    }
    
    @IBOutlet weak var cityTextField: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        self.window?.center()
        
        NSApp.activate(ignoringOtherApps: true)
        self.window?.makeKeyAndOrderFront(self)

    }
    
}
