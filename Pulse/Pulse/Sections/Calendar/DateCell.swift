//
//  DateCell.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-09.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import JTAppleCalendar
import UIKit

class DateCell: JTAppleCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    @IBOutlet weak var eventStackView: UIStackView!
    @IBOutlet weak var firstEventRow: DateEventView!
    @IBOutlet weak var secondEventRow: DateEventView!
    @IBOutlet weak var thirdEventRow: DateEventView!
    @IBOutlet weak var fourthEventRow: DateEventView!
    @IBOutlet weak var extraEventRow: DateEventView!
    
    var includedEvents: [DateEventView] = []
    var borderView: UIView!
    
    var eventColorAlpha: CGFloat = 0 {
        didSet {
            self.updateViews()
        }
    }
    
    func configureRows(events: [Event]) {
        firstEventRow.isHidden = true
        secondEventRow.isHidden = true
        thirdEventRow.isHidden = true
        fourthEventRow.isHidden = true
        extraEventRow.isHidden = true
        
        for (i, event) in events.enumerated() {
            if i == 0 {
                firstEventRow.configure(with: event)
                includedEvents.append(firstEventRow)
            } else if i == 1 {
                secondEventRow.configure(with: event)
                includedEvents.append(secondEventRow)
            } else if i == 2 {
                thirdEventRow.configure(with: event)
                includedEvents.append(thirdEventRow)
            } else if i == 3 {
                fourthEventRow.configure(with: event)
                includedEvents.append(fourthEventRow)
            } else {
                extraEventRow.configure(with: nil)
                includedEvents.append(extraEventRow)
            }
        }
        
        includedEvents.forEach { (view) in
            view.isHidden = false
            view.sizeToFit()
        }
    }
    
    private func updateViews() {
        for view in includedEvents {
            view.alpha = eventColorAlpha
        }
        
        self.addBorder()
    }
    
    private func addBorder() {
        if borderView != nil {
            borderView = nil
        }
        
        self.layer.borderColor = UIColor.separator.cgColor
        self.layer.borderWidth = 0.25
        
        borderView = UIView(frame: CGRect(x: 0, y: self.frame.height - 0.5, width: self.frame.width, height: 0.25))
        borderView.backgroundColor = .inverseLabel
        
        self.addSubview(borderView)
        self.bringSubviewToFront(borderView)
    }
}

extension UIColor {
    class var inverseLabel: UIColor {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            return .black
        } else {
            return .white
        }
    }
}
