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
                                    setPlaceholder: true)
    let fb_button = PrefButton(frame: Cons.PrefButton.set_frame, title: "Set")
    let fb_button_confirmation = TextLabel(frame: Cons.PrefConfirmation.frame, fontSize: 12)
    let first_separator = NSBox(frame: Cons.PrefSeparators.first)
    
    let fb_pages = PrefScroller(frame: Cons.PrefScroller.frame)
    let fb_pages_control = PrefControl(frame: Cons.PrefControl.frame)
    let pref_done_button = PrefButton(frame: Cons.PrefButton.done_frame, title: "Done")
    
    init() {
        super.init(window: NSWindow(contentRect: Cons.PrefWindow.frame,
                                    styleMask: .docModalWindow,
                                    backing: .nonretained,
                                    defer: false))
        
        self.fb_access.stringValue = Cons.PrefAccess.text
        self.fb_button_confirmation.textColor = Cons.PrefConfirmation.textColor
        self.first_separator.boxType = .primary
        
        self.window?.title = "Preferences"
        self.window?.styleMask = [.titled, .closable]
        self.window?.center()
        
        self.fb_button.action = #selector(self.add_api_key)
        self.pref_done_button.action = #selector(self.exit)
        
        self.window?.contentView?.addSubview(self.fb_access)
        self.window?.contentView?.addSubview(self.fb_access_input)
        self.window?.contentView?.addSubview(self.fb_button)
        self.window?.contentView?.addSubview(self.fb_button_confirmation)
        self.window?.contentView?.addSubview(self.first_separator)
        
        self.window?.contentView?.addSubview(self.fb_pages)
        self.window?.contentView?.addSubview(self.fb_pages_control)
        self.window?.contentView?.addSubview(self.pref_done_button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func add_api_key() {
        FBPageAPI.sharedInstance.ACCESS_TOKEN = self.fb_access_input.stringValue
        self.fb_button_confirmation.stringValue = Cons.PrefConfirmation.text
        UserDefaults.standard.set(self.fb_access_input.stringValue, forKey: "FB_ACCESS_TOKEN")
    }
    
    func exit() {
        let prefTable = self.fb_pages.prefTableView
        var pageList:[String] = []
        var pageDataList:[PageData] = []
        
        for (index, pageStatus) in prefTable.status.enumerated() {
            if (pageStatus == "200") {
                pageList.append(prefTable.data[index].id)
                pageDataList.append(prefTable.data[index])
            }
        }
        PageList.sharedInstance.data = pageDataList
        UserDefaults.standard.set(pageList, forKey: "FB_PAGE_LIST")
        
        self.close()
    }
    
}




