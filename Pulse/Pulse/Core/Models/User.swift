//
//  User.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-31.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation
import UIKit

struct User {
    
    var profileImage: UIImage = UIImage(named: "stock_profile")!
    
    var name: String {
        return firstName + " " + lastName
    }
    
    var firstName: String
    var lastName: String
    var friends: [Friend] = []
    
    var workouts: [Workout] = []
//    var totalWorkoutMinutes: Int {
//        return workouts.reduce(0, { $0 + $1.duration })
//    }
    var totalWorkoutMinutes: Int{
        return 0
    }
    var totalCollaborations: Int {
        return workouts.filter({ $0.invitees.count > 0 }).count
    }
    
    var notifications: [String] = []
}
