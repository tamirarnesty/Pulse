//
//  Data.swift
//  Pulse
//
//  Created by Cam Cunningham on 2020-03-10.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation

// Shared singleton data instance, holds workouts for now
class Data {
    var workouts: [Workout] = []
    static let sharedInstance: Data = Data()
}
