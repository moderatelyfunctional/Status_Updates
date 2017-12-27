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
    
    @IBOutlet weak var weatherItem: NSMenuItem!
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
        let pageTableView = self.weatherItem.view as! PagesTableView
        pageTableView.reloadData()

//        weatherAPI.fetchWeather("Boston") { weather in
//            let weatherView = self.weatherItem.view as! WeatherView
//            weatherView.city.stringValue = weather.city
//            weatherView.currentConditions.stringValue = weather.tempCondition
//        }
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
        
//        weatherItem.view = WeatherView()
//        weatherItem.view = PageView()
        
        weatherItem.view = PagesTableView()
        
        
    }
    
}








