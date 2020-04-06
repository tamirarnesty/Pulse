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
    
    static func generateWorkout(from workout: Workout) -> WorkoutInvitation {
        let newWorkout = Workout(title: workout.title, date: .randomWithinDaysAfterToday(15), duration: workout.duration, location: workout.location, host: workout.host, invitees: workout.invitees)
        return WorkoutInvitation(newWorkout)
    }
}

extension Date {
    /// SwiftRandom extension
    static func randomWithinDaysBeforeToday(_ days: Int) -> Date {
        let today = Date()
        let earliest = today.addingTimeInterval(TimeInterval(-days*24*60*60))
        
        return Date.random(between: earliest, and: today)
    }
    
    static func randomWithinDaysAfterToday(_ days: Int) -> Date {
        let today = Date()
        let latest = today.addingTimeInterval(TimeInterval(days*24*60*60))
        
        return Date.random(between: today, and: latest)
    }

    
    static func randomInSameMonth() -> Date {
        let today = Date()
        let startMonth = today.addingTimeInterval(TimeInterval(-15*24*60*60))
        let endMonth = today.addingTimeInterval(TimeInterval(15*24*60*60))
        
        return Date.random(between: startMonth, and: endMonth)
    }

    /// SwiftRandom extension
    static func random() -> Date {
        let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
        return Date(timeIntervalSince1970: randomTime)
    }
    
    static func random(between initial: Date, and final:Date) -> Date {
        let interval = final.timeIntervalSince(initial)
        let randomInterval = TimeInterval(arc4random_uniform(UInt32(interval)))
        return initial.addingTimeInterval(randomInterval)
    }

}
