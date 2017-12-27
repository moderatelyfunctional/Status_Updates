//
//  PageScroller.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/27/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PageScroller: NSScrollView {

    init(tableView: NSTableView) {
        super.init(frame: NSRect(x: 0, y: 0, width: Cons.PageView.width, height: Cons.PageView.height * 1.5))
        
        self.drawsBackground = false
        self.hasVerticalScroller = true
        self.hasHorizontalScroller = false
        self.borderType = .noBorder
        
        self.documentView = tableView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
