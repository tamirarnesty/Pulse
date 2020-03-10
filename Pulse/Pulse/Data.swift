//
//  Data.swift
//  Pulse
//
//  Created by Cam Cunningham on 2020-03-10.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation

class Data {
    var workouts: [Workout] = []
    static let sharedInstance: Data = {
        let instance = Data()
        // setup code
        return instance
    }()
}
