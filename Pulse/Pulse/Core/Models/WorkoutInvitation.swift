//
//  WorkoutInvitation.swift
//  Pulse
//
//  Created by admin on 2020-03-08.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation


class WorkoutInvitation {
    var workout: Workout
    var date: Date
    var invitee: String
    var location: String
    var type: String
    var time: String
    var isExpanded = false
    var hasResponse = false
    var isAccepted = false
    
    init(_ workout: Workout) {
        self.workout = workout
        self.date = workout.date
        self.invitee = workout.host.name
        self.location = workout.location
        self.type = workout.type.rawValue
        self.time = workout.date.timeOnly
    }
    
    init(workout: Workout, date: Date = Date(), invitee: String, location: String, type: String) {
        self.workout = workout
        self.date = date
        self.invitee = invitee
        self.location = location
        self.type = type
        self.time = date.timeOnly
    }
}
