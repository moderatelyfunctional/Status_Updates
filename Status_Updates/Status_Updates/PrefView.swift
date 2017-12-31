//
//  PrefView.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/27/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa

class PrefView: NSView {
    
    let name = TextLabel(frame: NSRect(x: 0, y: 0, width: Cons.PrefView.width, height: Cons.PrefView.height))
    
    init(page: PageData) {
        super.init(frame: NSRect(x: 0, y: 0, width: Cons.PrefView.width, height: Cons.PrefView.height))
        
        self.name.stringValue = page.name
        
        self.addSubview(self.name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
