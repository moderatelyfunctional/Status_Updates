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
    
    init(currentData: [PageData]) {
        self.index = currentData.count
        for element in currentData {
            self.data.append(element)
        }
        for _ in self.index..<Cons.PrefView.nRows {
            self.data.append(EmptyPageData)
        }
        super.init(frame: NSRect(x: 0, y: 0, width: Cons.PrefScroller.width, height: Cons.PrefScroller.height))
        
        let pageLinkColumn = NSTableColumn(identifier: "Link")
        pageLinkColumn.headerCell = NSTableHeaderCell(textCell: "Page Link")
        pageLinkColumn.width = Cons.PrefScroller.width * 0.3
        
        let pageTitleColumn = NSTableColumn(identifier: "Title")
        pageTitleColumn.headerCell = NSTableHeaderCell(textCell: "Title")
        pageTitleColumn.width = Cons.PrefScroller.width * 0.5
        
        let pageStatusColumn = NSTableColumn(identifier: "Status")
        pageStatusColumn.headerCell = NSTableHeaderCell(textCell: "Status")
        pageStatusColumn.width = Cons.PrefScroller.width * 0.20
        
        self.headerView = NSTableHeaderView(frame: NSRect(x: 0, y: 0, width: Cons.PrefScroller.width, height: Cons.PrefView.height))
        self.addTableColumn(pageLinkColumn)
        self.addTableColumn(pageTitleColumn)
        self.addTableColumn(pageStatusColumn)
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
        return PrefView(frame: Cons.PrefView.frame, fontSize: 12, text: self.data[row].name)
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return Cons.PrefView.height
    }
    
}





