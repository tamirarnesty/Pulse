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
    /*var index: Int
    var workout: ProfileWorkout
    init(index: Int, workout: ProfileWorkout) {
        self.index = index
        self.workout = workout
    }*/
    @IBAction func joinBtn(_ sender: Any) {
    }
    
    @IBAction func declineBtn(_ sender: Any) {
    }
    
}
