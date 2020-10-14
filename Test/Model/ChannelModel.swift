//
//  ChannelModel.swift
//  Test
//
//  Created by Admin on 10/15/20.

// This is Channel Model
//

import Foundation


class ChannelModel: NSObject {
    var name = ""
    var key = ""
    var value  = 0
    
    override init() {
        super.init()
    }
    
    init(dict: [String: Any]) {
        if let val = dict["name"] as? String   { name = val }
        if let val = dict["key"] as? String    { key = val }
        if let val = dict["value"] as? Int     { value = val }
    }
}
