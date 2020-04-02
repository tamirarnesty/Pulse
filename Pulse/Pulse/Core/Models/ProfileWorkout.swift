//
//  ProfileWorkout.swift
//  Pulse
//
//  Created by admin on 2020-03-07.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class ProfileWorkout {
    var date: Date
    var invitee: String
    var location: String
    var type: String
    var time: String
    
    init(date: Date = Date(), invitee: String, location: String, type: String) {
        self.date = date
        self.invitee = invitee
        self.location = location
        self.type = type
        self.time = date.timeOnly
    }
}
