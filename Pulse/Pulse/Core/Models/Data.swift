//
//  Data.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-10.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation

// Shared singleton data instance, holds workouts for now
class Data {
    static let sharedInstance: Data = Data()
    
    var workouts: [Workout] = [] {
        didSet {
            self.postHomeWorkoutsChanged()
        }
    }
}

extension Data {
    func postHomeWorkoutsChanged() {
        print("DATA: Workouts changed!")
        
        NotificationCenter.default.post(name: .homeChanged, object: self)
    }
    
}
// MARK: Notification Names

extension Notification.Name {
    static var homeChanged: Notification.Name { Notification.Name("HOME_CHANGED") }
    
    static var calendarChanged: Notification.Name { Notification.Name("CALENDAR_CHANGED") }

    static var profileChanged: Notification.Name { Notification.Name("PROFILE_CHANGED") }
}
