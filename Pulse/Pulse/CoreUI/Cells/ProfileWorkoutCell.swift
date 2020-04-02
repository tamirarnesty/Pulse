//
//  ProfileWorkoutCell.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-04-01.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class ProfileWorkoutCell: UITableViewCell {

    @IBOutlet weak var invitedByLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    
    var expandClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with workout: WorkoutInvitation) {
        invitedByLabel.text = workout.invitee
        dateLabel.text = workout.date.dateOnly
    }
    
    @IBAction func didTapExpand(_ sender: UIButton) {
        expandClosure?()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
