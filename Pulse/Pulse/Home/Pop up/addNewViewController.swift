//
//  addNewViewController.swift
//  Pulse
//
//  Created by Ellie Sekine on 2020-03-08.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class addNewViewController: UITableViewController {
    
    var startCell = 1
    var endCell = 2
    private var startDateCellExpanded = false
    private var endDateCellExpanded = false
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var currentStartDateLabel: UILabel!
    @IBOutlet weak var currentEndDateLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    var dateFormatter: DateFormatter = DateFormatter()
    
    
    
    override func viewDidLoad() {
//        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        saveButton.layer.cornerRadius = 12
        currentStartDateLabel.text = dateFormatter.string(from: startDatePicker.date)
        currentEndDateLabel.text = dateFormatter.string(from: endDatePicker.date)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == startCell{
            if startDateCellExpanded{
                startDateCellExpanded = false
                currentStartDateLabel.text = dateFormatter.string(from: startDatePicker.date)
            }
            else{
                startDateCellExpanded = true
            }
        
        }
        if indexPath.row == endCell{
            if endDateCellExpanded{
                endDateCellExpanded = false
                currentEndDateLabel.text = dateFormatter.string(from: endDatePicker.date)
            }
            else{
                endDateCellExpanded = true
            }
              
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if startDateCellExpanded && indexPath.row == startCell{
                return 250
            } else if startDateCellExpanded == false && indexPath.row == startCell {
                return 50
            }
        
            if endDateCellExpanded  && indexPath.row == endCell{
                return 250
            
            } else if endDateCellExpanded == false && indexPath.row == endCell {
                return 50
        }
        
        if indexPath.row == 6 {
            return 250
        }
        if indexPath.row == 7 {
            return 75
        }
        return 50
          
       }
}
