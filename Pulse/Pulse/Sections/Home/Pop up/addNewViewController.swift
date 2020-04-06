//
//  addNewViewController.swift
//  Pulse
//
//  Created by Ellie Sekine on 2020-03-08.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

// Adding a new workout

class addNewViewController: UITableViewController {
    
    var startCell = 1
    var endCell = 2
    private var startDateCellExpanded = false
    private var endDateCellExpanded = false
    @IBOutlet weak var workoutNameTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var currentStartDateLabel: UILabel!
    @IBOutlet weak var currentEndDateLabel: UILabel!
    @IBOutlet weak var addNote: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var locationTextField: UITextField!
    var dateFormatter: DateFormatter = DateFormatter()
    
    @IBOutlet weak var navigationBarTitle: UINavigationItem!
    
    override func viewDidLoad() {
        dateFormatter.dateStyle = DateFormatter.Style.medium
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
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Save button hit
    @IBAction func saveButtonPressed(_ sender: Any) {
        // When save was pressed, we want to check that all fields are filled and then create a workout item with the data
        // We then add that to the shared datasource
        
        let bob = Friend(firstName: "Girth", lastName: "E")
        // *** Create date ***
        let startDate = startDatePicker.date
        let endDate = endDatePicker.date
        
        // *** create calendar object ***
        var calendar = Calendar.current
        var location = "Contact Host"
        
        if !locationTextField.text!.isEmpty {
            location = locationTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        // *** define calendar components to use as well Timezone to UTC ***
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let interval = endDate.timeIntervalSince(startDate)
        
        let user = DataEngine.shared.user
        
        var title = "Workout"
        if !workoutNameTextField.text!.isEmpty {
            title = workoutNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        DataEngine.shared.workouts.append(Workout(title: title, date: startDatePicker.date, duration: interval, location: location, host: Friend(firstName: user.firstName, lastName: user.lastName, profileImage: user.profileImage, friends: user.friends), invitees: DataEngine.shared.invitedFriends))
        
        DataEngine.shared.postHomeWorkoutsChanged()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startDatePickerChanged(_ sender: Any) {
        currentStartDateLabel.text = dateFormatter.string(from: startDatePicker.date)
        
        if startDatePicker.date >= endDatePicker.date {
            endDatePicker.setDate(startDatePicker.date, animated: true)
            currentEndDateLabel.text = dateFormatter.string(from: endDatePicker.date)
        }
    }
    
    @IBAction func endDatePickerChanged(_ sender: Any) {
        currentEndDateLabel.text = dateFormatter.string(from: endDatePicker.date)
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
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func workoutNameEdited(_ sender: Any) {
        navigationBarTitle.title = workoutNameTextField.text
    }
    
    @IBAction func checkMySchedulePressed(_ sender: Any) {
        //self.performSegue(withIdentifier: "checkSchedule", sender: sender)
        
    }
    
}
