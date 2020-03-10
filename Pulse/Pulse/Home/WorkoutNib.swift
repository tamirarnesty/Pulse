//
//  workout.swift
//  Pulse
//
//  Created by Ellie Sekine on 2020-03-07.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class WorkoutNib: UITableViewCell {

    var dayText: String = ""
    var timeText: String = ""
    var locationText: String = ""
    var messageFromText: String = ""
    var messageText: String = ""
    var titleText: String = ""
    var hostText: String = ""
    var invitedByText: String = ""
    
    override func awakeFromNib() {
        // Called when nib is instantiated
    }
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var messageFromLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hostLabel: UILabel!
    @IBOutlet weak var invitedByLabel: UILabel!
    
    func assignLabes(){
        
    }
}

