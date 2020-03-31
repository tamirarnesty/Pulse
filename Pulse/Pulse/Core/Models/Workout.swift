//
//  Workout.swift
//  Pulse
//
//  Created by admin on 2020-03-08.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation


struct Workout {
    var title: String
    var date: Date
    var location: String
    var type: WorkoutType
    var host: Friend
    var invitees: [Friend]
    var message: String?
    
    var duration: Int
    
    init(title: String, date: Date, duration: Int, location: String, type: WorkoutType, host: Friend, invitees: [Friend], message: String? = nil) {
        self.title = title
        self.date = date
        self.duration = duration
        self.location = location
        self.type = type
        self.invitees = invitees
        self.message = message
        self.host = host
    }
}

enum WorkoutType: String {
    case legs = "Legs"
    case arms = "Arms"
    case fullBody = "Full Body"
    case shoulders = "Shoulders"
}
