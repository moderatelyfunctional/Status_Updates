//
//  StatusMenuController.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {

    let weatherAPI = WeatherAPI()
    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)
    
    @IBOutlet weak var weatherItem: NSMenuItem!
    @IBOutlet weak var statusMenu: NSMenu!
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func updateClicked(_ sender: NSMenuItem) {
        weatherAPI.fetchWeather("Boston") { weather in
            let weatherView = self.weatherItem.view as! WeatherView
            weatherView.city.stringValue = weather.city
            weatherView.currentConditions.stringValue = weather.tempCondition
        }
    }
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true
        
        self.statusItem.image = icon
        self.statusItem.menu = statusMenu
        
        weatherItem.view = WeatherView()
    }
    
}
