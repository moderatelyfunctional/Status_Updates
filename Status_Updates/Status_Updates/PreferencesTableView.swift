//
//  PreferencesTableView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/27/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//
import Cocoa

class PreferencesTableView: NSTableView, NSTableViewDelegate, NSTableViewDataSource {
    
    var data:[PageData] = []
    var index:Int = 0
    
    init() {
        self.index = PageList.sharedInstance.data.count
        for element in PageList.sharedInstance.data {
            self.data.append(element)
        }
        for _ in self.index..<Cons.PrefView.nRows {
            self.data.append(EmptyPageData)
        }
        super.init(frame: NSRect(x: 0,
                                 y: 0,
                                 width: Cons.PrefTableView.width,
                                 height: Cons.PrefTableView.height))
        
        let pageColumn = NSTableColumn(identifier: "Facebook Pages")
        pageColumn.width = Cons.PrefView.width
        
        self.headerView = NSTableHeaderView(frame: NSRect(x: 0, y: 0, width: Cons.PrefTableView.width, height: Cons.PrefView.height))
        self.addTableColumn(pageColumn)
        self.backgroundColor = NSColor.clear
        self.usesAlternatingRowBackgroundColors = true
        
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        return PrefView(page: self.data[row])
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return Cons.PrefView.height
    }
    
}
