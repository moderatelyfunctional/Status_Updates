//
//  StatusMenuController.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject, NSTableViewDelegate, NSTableViewDataSource {

//    let weatherAPI = WeatherAPI()
    let fbPageAPI = FBPageAPI()
    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)
    
    @IBOutlet weak var pagesItem: NSMenuItem!
//    @IBOutlet weak var pageItem: NSMenuItem!
    @IBOutlet weak var statusMenu: NSMenu!
    
    let preferencesWindow = PreferencesWindow()
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func preferencesClicked(_ sender: NSMenuItem) {
        NSApp.activate(ignoringOtherApps: true)
        self.preferencesWindow.showWindow(nil)
    }

    
    @IBAction func updateClicked(_ sender: NSMenuItem) {
<<<<<<< HEAD
        fbPageAPI.fetchPage("beaverconfessions") { page in
            NSLog(page.prettyPage)
        }
        let pageTableView = self.weatherItem.view as! PagesTableView
=======
        let pageTableView = self.pagesItem.view as! PagesTableView
>>>>>>> 871801394bde5758856534227e9de1b9feaa28c3
        pageTableView.reloadData()

//        fbPageAPI.fetchPage("beaverconfessions") { page in
//            let pageView = self.weatherItem.view as! PageView
//            pageView.summary.stringValue = page.prettyPage
//        }
    }
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true
        
        self.statusItem.image = icon
        self.statusItem.menu = statusMenu

        self.pagesItem.view = PageScroller(tableView: PagesTableView())
    }
    
}








