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

extension Int {
    
//    https://stackoverflow.com/questions/37335286/given-a-number-n-find-how-many-digits-in-that-number-are-useful-a-digit-in-the
    public var numDigits: Int {
        get {
            return countDigits()
        }
    }
    
    private func countDigits() -> Int {
        var num = abs(self)
        var count = 0
        while num > 0 {
            let digit = num % 10
            if digit != 0 && self % digit == 0 {
                count += 1
            }
            num = num / 10
        }
        return count
    }

    
}
