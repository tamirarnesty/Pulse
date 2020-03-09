//
//  workout.swift
//  Pulse
//
//  Created by Ellie Sekine on 2020-03-07.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class workout: UITableViewCell {
    


    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var hostLabel: UILabel!
    
    @IBOutlet weak var invitedByLabel: UILabel!
    
    @IBOutlet weak var messageFromLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var workoutBox: UIView!
    
    func workoutBoxAppearance(){
        workoutBox.layer.cornerRadius = 40
    }
    func assignLabes(){
        
    }
}

