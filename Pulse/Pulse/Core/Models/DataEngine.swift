//
//  DataEngine.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-10.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation

// Shared singleton data instance, holds workouts for now
class DataEngine {
    static let shared: DataEngine = DataEngine()
    
    var workouts: [Workout] = [] {
        didSet {
            self.postHomeWorkoutsChanged()
        }
    }
    
    var friendsList: [Friend] = [] {
        didSet {
            self.postFriendsListChanged()
        }
    }
    
    func addWorkout(_ workout: Workout) {
        workouts.append(workout)
    }
    
    func addFriend(_ friend: Friend) {
        friendsList.append(friend)
    }
}

extension DataEngine {
    func postHomeWorkoutsChanged() {
        print("DATA: Workouts changed!")
        
        NotificationCenter.default.post(name: .homeChanged, object: self)
    }
    
    func postCalendarChanged() {
        print("DATA: Calendar changed!")
        
        NotificationCenter.default.post(name: .calendarChanged, object: self)
    }
    
    func postProfileChanged() {
        print("DATA: Profile changed!")
        
        NotificationCenter.default.post(name: .profileChanged, object: self)
    }
    
    func postFriendsListChanged() {
        print("DATA: Profile changed!")
        
        NotificationCenter.default.post(name: .friendsListChanged, object: self)
    }
}
// MARK: Notification Names

extension Notification.Name {
    static var homeChanged: Notification.Name { Notification.Name("HOME_CHANGED") }
    
    static var calendarChanged: Notification.Name { Notification.Name("CALENDAR_CHANGED") }

    static var profileChanged: Notification.Name { Notification.Name("PROFILE_CHANGED") }

    static var friendsListChanged: Notification.Name { Notification.Name("PROFILE_CHANGED") }
}
