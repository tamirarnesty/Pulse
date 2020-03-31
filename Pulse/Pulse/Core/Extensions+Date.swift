//
//  Extensions+Date.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-31.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation

extension Date {
    func format(for option: String, dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .short) -> String {
        let formatter = DateFormatter()
        switch option {
        case "date":
            formatter.dateStyle = dateStyle
            formatter.timeStyle = .none
            return formatter.string(from: self)
        case "time":
            formatter.timeStyle = timeStyle
            formatter.dateStyle = .none
            return formatter.string(from: self)
        default:
            print("Error formatting Date string")
            return ""
        }
    }
    
    var timeOnly: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter.string(from: self)
    }
    
    var dateOnly: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM dd yyyy"
        return formatter.string(from: self)
    }
    
    var meridiem: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        return formatter.string(from: self)
    }
    
    static var tomorrow: Date {
        return Date(timeIntervalSinceNow: 86400)
    }
    
    var dayOfWeek: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: self)
    }
}
