//
//  ProfileWorkoutExpandedCell.swift
//  Pulse
//
//  Created by admin on 2020-03-08.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class ProfileWorkoutExpandedCell: UICollectionViewCell {
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var invitee: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var town: UILabel!
    var joined = false
    var declined = false
    /*var index: Int
    var workout: ProfileWorkout
    init(index: Int, workout: ProfileWorkout) {
        self.index = index
        self.workout = workout
    }*/
    @IBAction func joinBtn(_ sender: Any) {
        joinBtnText.setTitle("Joined", for: UIControl.State.normal)
        joinBtnText.isEnabled = false
        declineBtnText.isHidden = true
        declineBackground.isHidden = true
        joined = true
    }
    
    @IBAction func declineBtn(_ sender: Any) {
        declineBtnText.setTitle("Declined", for: UIControl.State.normal)
        declineBtnText.isEnabled = false
        joinBtnText.isHidden = true
        joinBackground.isHidden = true
        declined = true
    }
    
    @IBOutlet weak var declineBtnText: UIButton!
    @IBOutlet weak var declineBackground: UIImageView!
    @IBOutlet weak var joinBtnText: UIButton!
    @IBOutlet weak var joinBackground: UIImageView!
}
