//
//  Friend.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-31.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation

struct Friend {
    
    var name: String {
        return firstName + " " + lastName
    }
    
    var firstName: String
    var lastName: String
    var friends: [Friend] = []
}
