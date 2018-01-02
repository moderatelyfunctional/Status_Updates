//
//  Extensions.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/26/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Cocoa
import Foundation

extension Date {
    
    static func hoursPrior(currDate: Date) -> Int {
        let now = Date()
        let difference = -1 * now.timeIntervalSince(currDate)
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
    
//    https://stackoverflow.com/questions/39677330/how-does-string-substring-work-in-swift
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
}

extension Int {
    
//    https://stackoverflow.com/questions/37335286/given-a-number-n-find-how-many-digits-in-that-number-are-useful-a-digit-in-the
    public var numDigits: Int {
        get {
            return numberOfDigits(in: self)
        }
    }
    
    private func numberOfDigits(in number: Int) -> Int {
        if abs(number) < 10 {
            return 1
        } else {
            return 1 + numberOfDigits(in: number/10)
        }
    }
    
}
