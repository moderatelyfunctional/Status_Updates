//
//  PrefData.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/29/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Foundation

final class PrefData {
    
    static let sharedInstance = PrefData()
    var FB_ACCESS_KEY:String = ""
    
    private init() { }
    
}
