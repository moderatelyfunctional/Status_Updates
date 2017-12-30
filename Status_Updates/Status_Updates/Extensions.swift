//
//  Extensions.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa
import Foundation

extension NSDate {
    
    static func hoursPrior(currDate: NSDate) -> Int {
        let now = NSDate()
        let difference = -1 * now.timeIntervalSince(currDate as Date)
        let secondsInHour = 3600.0
        
        let hours = difference / secondsInHour
        
        return Int(hours)
    }
    
}

extension String {
    
    func width(fontSize: CGFloat) -> CGFloat {
        let font = NSFont(name: "Helvetica Neue", size: fontSize)
        let size = self.size(withAttributes: [NSFontAttributeName: font!])
        return ceil(size.width) + 5
    }
    
}
