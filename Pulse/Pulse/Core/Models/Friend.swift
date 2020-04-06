//
//  Friend.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-31.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation
import UIKit

struct Friend: Equatable {
    
    var name: String {
        return firstName + " " + lastName
    }
    
    var firstName: String
    var lastName: String
    var profileImage: UIImage = UIImage(named: "stock_profile")!

    var friends: [Friend] = []
    
    static func ==(lhs: Friend, rhs: Friend) -> Bool {
        return lhs.name == rhs.name
    }
}

