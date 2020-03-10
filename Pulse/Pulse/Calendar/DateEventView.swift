//
//  DateEventView.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-09.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class DateEventView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var event: Event!
    
    /// Configure the event row cell with the provided event.
    /// - Parameter optionalE: The event data for the row. If `nil`, the input is assumed to be empty and a default value of clear background and "•••" is inputted.
    func configure(with optionalE: Event?) {
        guard let event = optionalE else {
            // Default data for nil event data
            self.titleLabel.text = "•••"
            self.backgroundColor = .clear
            
            return
        }
        
        layer.cornerRadius = 2
        self.event = event
        
        self.titleLabel.text = event.title
        self.backgroundColor = event.color
        
        self.titleLabel.sizeToFit()
        self.sizeToFit()
    }
}
