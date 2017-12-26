//
//  Weather.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Foundation

typealias JSON = [String:AnyObject]

struct Weather {
    var city:String
    var currentTemp:Float
    var conditions:String
    
    var tempCondition:String {
        return "\(currentTemp)F and \(conditions)"
    }
    
    var description:String {
        return "\(city): \(currentTemp)F and \(conditions)"
    }
}
