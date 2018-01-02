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
    var status:[String] = []
    
    init(currentData: [PageData]) {
        for element in currentData {
            self.data.append(element)
            self.status.append("200")
        }
        for _ in 0..<Cons.PrefView.nRows {
            self.data.append(EmptyPageData)
            self.status.append("")
        }
        super.init(frame: NSRect(x: 0, y: 0, width: Cons.PrefScroller.width, height: Cons.PrefScroller.height))
        
        let pageLinkColumn = NSTableColumn(identifier: "Link")
        pageLinkColumn.headerCell = NSTableHeaderCell(textCell: "Page ID")
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
        let editable = tableColumn?.identifier == "Link" ? true : false
        var text = self.status[row]
        if (tableColumn?.identifier == "Link") {
            text = self.data[row].id
        } else if (tableColumn?.identifier == "Title") {
            text = self.data[row].name
        }
        
        return PrefView(frame: Cons.PrefView.frame, text: text, row: row, editable: editable, delegate: self)
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return row == self.data.count - 1 ? false : true
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return Cons.PrefView.height
    }
    
}

extension PreferencesTableView {
    
    func addFBPage() {
        self.deselectAll(nil)
        let row = self.data.count - 1
        self.editColumn(0, row: row, with: nil, select: true)
        self.selectRowIndexes(IndexSet(integer: row), byExtendingSelection: false)
    }
    
    func removeFBPage() {
        if (self.data.count == 1) {
            return
        }
        let removeIndex = self.data.count - 2 // the last index is the empty row
        let nextRemoveIndex = removeIndex - 1
        self.data.remove(at: removeIndex)
        self.status.remove(at: removeIndex)
        if (nextRemoveIndex >= 0) {
            self.selectRowIndexes(IndexSet(integer: nextRemoveIndex), byExtendingSelection: false)
        }
        self.reloadData()
    }
}

extension PreferencesTableView: PrefFBPageDelegate {
    
    func insertFBID(row: Int, id: String) {
        FBPageAPI.sharedInstance.fetchStatus(id) { pageStatus in
            self.status[row] = "\(pageStatus.status)"
            self.data[row].id = id
            self.data[row].name = pageStatus.name
            self.data.append(EmptyPageData)
            self.status.append("")
            
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
}

