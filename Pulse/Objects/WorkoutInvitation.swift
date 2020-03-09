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
    var expanded: Bool
    var responded: Bool
    var accepted: Bool
    
    init(workout: Workout) {
        self.workout = workout
        self.expanded = false
        self.responded = false
        self.accepted = false
    }
}
