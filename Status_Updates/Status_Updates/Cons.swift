//
//  Cons.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//
import Cocoa

struct Cons {
    struct PageView {
        static let width:CGFloat = 200.0
        static let height:CGFloat = 110
        static let offsetX:CGFloat = 20.0
        static let offsetY:CGFloat = 5.0
        static let separator:CGFloat = 1.0
        
        static let nameHeight:CGFloat = 20.0
        static let nameY:CGFloat = height - offsetY - nameHeight
        
        static let likesY:CGFloat = nameY - nameHeight
        
        static let postsY:CGFloat = likesY - nameHeight - 9 * separator
        
        static let updatedY:CGFloat = postsY - nameHeight
    }
    struct PrefWindow {
        static let width:CGFloat = 400.0
        static let height:CGFloat = 550
        
        static let frame:NSRect = NSRect(x: 0, y: 0, width: width, height: height)
    }
    struct PrefAccess {
        static let text:String = "FB_ACCESS_KEY :"
        static let fontSize:CGFloat = 12.0
        
        static let offsetX:CGFloat = 20
        static let offsetY:CGFloat = PrefWindow.height - 60
        static let width:CGFloat = text.width(fontSize: fontSize)
        static let height:CGFloat = 20
        
        static let frame:NSRect = NSRect(x: offsetX, y: offsetY, width: width, height: height)
    }
    struct PrefAccessInput {
        static let placeholder:String = "Insert Facebook API Key"
        static let fontSize:CGFloat = 12.0
        
        static let offsetX:CGFloat = Cons.PrefAccess.offsetX + Cons.PrefAccess.width + 5
        static let offsetY:CGFloat = Cons.PrefAccess.offsetY
        static let width:CGFloat = placeholder.width(fontSize: fontSize) + 10
        static let height:CGFloat = Cons.PrefAccess.height
        
        static let frame:NSRect = NSRect(x: offsetX, y: offsetY, width: width, height: height)
    }
    struct PrefButton {
        static let offsetX:CGFloat = Cons.PrefAccessInput.offsetX + Cons.PrefAccessInput.width + 10
        static let offsetY:CGFloat = Cons.PrefAccess.offsetY - 3
        static let width:CGFloat = Cons.PrefWindow.width - Cons.PrefButton.offsetX - 20
        static let height:CGFloat = Cons.PrefAccess.height
        
        static let set_frame:NSRect = NSRect(x: offsetX, y: offsetY, width: width, height: Cons.PrefAccess.height + 5)
        static let done_frame:NSRect = NSRect(x: offsetX, y: PrefControl.offsetY - 20, width: width, height: Cons.PrefAccess.height + 5)
    }
    struct PrefConfirmation {
        static let offsetX:CGFloat = PrefAccessInput.offsetX
        static let offsetY:CGFloat = PrefAccessInput.offsetY - PrefAccessInput.height
        static let width:CGFloat = PrefAccessInput.width
        static let height:CGFloat = PrefAccessInput.height
        
        static let text:String = "Facebook API Key Set"
        static let textColor:NSColor = NSColor.gray
        
        static let frame:NSRect = NSRect(x: offsetX, y: offsetY, width: width, height: height)
    }
    struct PrefSeparators {
        static let first:NSRect = NSRect(x: PrefAccess.offsetX, y: PrefAccess.offsetY - 30, width: PrefWindow.width - 2 * PrefAccess.offsetX, height: 1.0)
    }
    struct PrefTableView {
        static let width:CGFloat = 360
        static let height:CGFloat = 200
        static let separator:CGFloat = 15
        
        static let offsetX:CGFloat = (Cons.PrefWindow.width - width) / 2
        static let offsetY:CGFloat = 80
    }
    struct PrefView {
        static let nRows:Int = 1
        static let width:CGFloat = 360
        static let height:CGFloat = 20
        
        static let frame:NSRect = NSRect(x: 0, y: 0, width: width, height: height)
    }
    struct PrefScroller {
        static let offsetX:CGFloat = 40.0
        static let offsetY:CGFloat = PrefSeparators.first.origin.y - 32 - height
        static let width:CGFloat = PrefWindow.width - 2 * offsetX
        static let height:CGFloat = 300
        
        static let frame:NSRect = NSRect(x: offsetX, y: offsetY, width: width, height: height)
    }
    struct PrefControl {
        static let offsetX:CGFloat = 40.0
        static let offsetY:CGFloat = PrefScroller.offsetY - height
        static let width:CGFloat = 96
        static let height:CGFloat = 35
        
        static let frame:NSRect = NSRect(x: offsetX, y: offsetY, width: width, height: height)
    }
}














