//
//  PagesTableView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PagesTableView: NSTableView, NSTableViewDelegate, NSTableViewDataSource {
    
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
        return PageList.sharedInstance.data.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        return PageView(page: PageList.sharedInstance.data[row])
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return Cons.PageView.height
    }
    
}
















