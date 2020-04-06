//
//  Event.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-09.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation
import UIKit

struct Event {
    
    var title: String
    
    var startDate: Date
    var endDate: Date
    
    var isRepeating: Bool = false
    
    var color: UIColor
    
    static func createFrom(workout: Workout) -> Event {
        let randomColor = UIColor.random()
        return Event(title: workout.title, startDate: workout.date, endDate: Date(timeInterval: workout.duration*60, since: workout.date), color: randomColor)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
