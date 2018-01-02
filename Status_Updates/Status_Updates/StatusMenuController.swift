//
//  StatusMenuController.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject, StatusReloadDelegate {

    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)
    
    @IBOutlet weak var pagesItem: NSMenuItem!
    @IBOutlet weak var statusMenu: NSMenu!
    
    let preferencesWindow = PreferencesWindow()
    var dataTableView = PagesTableView()
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func preferencesClicked(_ sender: NSMenuItem) {
        NSApp.activate(ignoringOtherApps: true)
        self.preferencesWindow.window?.title = "Preferences"
        self.preferencesWindow.showWindow(nil)
    }

    @IBAction func updateClicked(_ sender: NSMenuItem) {
        PageList.sharedInstance.data = PageList.fetchData()
        let pageScroller = self.pagesItem.view as! PageScroller
        let pageTableView = pageScroller.documentView as! PagesTableView
        pageTableView.reloadData()
    }
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true
        
        self.statusItem.image = icon
        self.statusItem.menu = statusMenu
        self.preferencesWindow.statusDelegate = self
        self.pagesItem.view = PageScroller(tableView: self.dataTableView)
    }
}





