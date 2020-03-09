//
//  Workout.swift
//  Pulse
//
//  Created by admin on 2020-03-08.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation


class Workout {
    var date: String!
    var invitee: String!
    var location: String!
    var type: String!
    var time: String!
    init(date: String, time: String, location: String, type: String, invitee: String) {
        self.date = date
        self.time = time
        self.location = location
        self.type = type
        self.invitee = invitee
    }
}
