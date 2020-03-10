//
//  Workout.swift
//  Pulse
//
//  Created by admin on 2020-03-08.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation


class Workout {
    var title: String
    var date: Date
    var invitee: String
    var location: String
    var type: String
    var time: String
    var town: String
    var message: String
    var host: String
    
    init(title: String = "", date: Date, time: String, location: String, town: String, type: String, host: String, invitee: String, message: String = "") {
        self.title = title
        self.date = date
        self.time = time
        self.location = location
        self.town = town
        self.type = type
        self.invitee = invitee
        self.message = message
        self.host = host
    }
}
