//
//  PagesTableView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PagesTableView: NSTableView, NSTableViewDelegate, NSTableViewDataSource {
    
    let pageList = [PageData(name: "MIT Confessions",
                             likes: 18940,
                             updated: NSDate(timeIntervalSinceNow: TimeInterval(exactly: 18.0)!)),
                    PageData(name: "Overheard At MIT",
                             likes: 2242,
                             updated: NSDate(timeIntervalSinceNow: TimeInterval(exactly: 18.0)!)),
                    PageData(name: "MIT Onion",
                             likes: 18940,
                             updated: NSDate(timeIntervalSinceNow: TimeInterval(exactly: 18.0)!))
    ]
    
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: Cons.PageView.width, height: 400))
        
        let column = NSTableColumn()
        column.resizingMask = .autoresizingMask
        column.width = Cons.PageView.width
        
        
        self.addTableColumn(column)
        self.backgroundColor = NSColor.clear
        
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.pageList.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        return PageView(page: self.pageList[row])
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return Cons.PageView.height
    }
    
}
















