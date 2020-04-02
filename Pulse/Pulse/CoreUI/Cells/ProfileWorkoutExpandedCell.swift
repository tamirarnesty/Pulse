//
//  ProfileWorkoutExpandedCell.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-04-01.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class ProfileWorkoutExpandedCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var workoutTypeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var declineButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!

    var isJoined: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        joinButton.layer.cornerRadius = 10
        declineButton.layer.cornerRadius = 10

        joinButton.setTitle("Join", for: .normal)
        declineButton.setTitle("Decline", for: .normal)
    }
    
    func configure(with workout: WorkoutInvitation) {
        nameLabel.text = workout.invitee
        dateLabel.text = workout.date.dateOnly
        timeLabel.text = workout.time
        
        workoutTypeLabel.text = workout.type
        locationLabel.text = workout.location
    }
    
    @IBAction func didPressJoin(_ sender: UIButton) {
        declineButton.isHidden = true
        joinButton.setTitle("Joined", for: .normal)
        isJoined = true
    }
    
    @IBAction func didPressDecline(_ sender: UIButton) {
        joinButton.isHidden = true
        declineButton.setTitle("Declined", for: .normal)
        isJoined = false
    }
}
