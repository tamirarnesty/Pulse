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
    @IBOutlet weak var scheduleButton: UIButton!
    
    override func awakeFromNib() {
        self.colorView.layer.cornerRadius = 10
        self.scheduleButton.layer.cornerRadius = 10
        self.scheduleButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func loadData(from workout: Workout) {
        self.titleLabel.text = workout.title
        
        self.locationLabel.text = workout.location
        self.messageLabel.text = workout.message
        self.hostLabel.text = "Host: " + workout.host.name
        if let invitee = workout.invitees.randomElement() {
            self.invitedByLabel.text = "Invited by " + invitee.name
        } else {
            self.invitedByLabel.text = ""
        }
        self.timeLabel.text = workout.date.timeOnly
        self.dayLabel.text = workout.date.dayOfWeek
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
//            scheduleButton.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                self.scheduleButton.alpha = 1
                self.messageLabel.alpha = 0
            }) { (completed) in
                if completed {
                    self.messageLabel.isHidden = true
                }
            }
        } else {
            self.messageLabel.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                self.scheduleButton.alpha = 0
                self.messageLabel.alpha = 1
            }) { (completed) in
                if completed {
//                    self.scheduleButton.isHidden = true
                }
            }
        }
    }
}
