//
//  workout.swift
//  Pulse
//
//  Created by Ellie Sekine on 2020-03-07.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

// Reference to the workout nib
class WorkoutNib: UITableViewCell {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageFromLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hostLabel: UILabel!
    @IBOutlet weak var invitedByLabel: UILabel!
    
    override func awakeFromNib() {
        self.colorView.layer.cornerRadius = 10
        
    }
    
    func loadData(from workout: Workout) {
        self.titleLabel.text = workout.title
        
        self.locationLabel.text = workout.location
        self.messageLabel.text = workout.message
        self.invitedByLabel.text = workout.invitee
        self.timeLabel.text = workout.time
        self.dayLabel.text = workout.date.dayOfWeek
        
    }
}

extension Date {
    
    var timeOnly: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter.string(from: self)
    }
    
    var string: String {
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
