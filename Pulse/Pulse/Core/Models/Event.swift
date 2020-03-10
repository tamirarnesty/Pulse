//
//  Event.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-09.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import Foundation
import UIKit

struct Event {
    
    var title: String
    
    var startDate: Date
    var endDate: Date
    
    var isRepeating: Bool = false
    
    var color: UIColor
}
