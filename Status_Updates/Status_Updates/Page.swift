//
//  Weather.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Foundation

//typealias JSON = [String:AnyObject]

struct Page {
    var time:String
    var content:String
    var ID:String

    var prettyPage:String {
        return "Time:\(time), Content:\(content), ID:\(ID)"
    }
}
