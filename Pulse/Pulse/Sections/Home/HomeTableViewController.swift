//
//  HomeTableViewController.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-10.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    // These will be filled with type workout: Today and Coming up
    var today: [Workout] = []
    var comingUp: [Workout] {
        return Data.sharedInstance.workouts
    }
    
    // Headers for the separated table view
    var headers = ["Today", "Coming Up"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view."
        
        // Register the nib
        tableView.register(UINib(nibName: "WorkoutNib", bundle: nil), forCellReuseIdentifier: "Cell")
        
        // Test data: Append a workkout to today
        today.append(Workout(title: "Leg day!", date: Date(), time: "6:30PM - 8:00PM", location: "ARC", town: "Kingston", type: "Workout", host: "Ellie", invitee: "invitee", message: "Message"))

        // Reload the table
        tableView.reloadData()
        
        self.loadData()
    }
    
    func loadData() {
        var data: [Workout] = []
//        data.append(Workout(title: "Arm day", date: Date(), time: "6:30PM - 8:00PM", location: "ARC", town: "Kingston", type: "Workout", host: "Ellie", invitee: "invitee", message: "Message"))
        data.append(Workout(title: "Group sesh", date: .tomorrow, time: "4:15PM - 5:15PM", location: "ARC", town: "Kingston", type: "Workout", host: "Cam", invitee: "invitee", message: "Message"))
        data.append(Workout(title: "Lets get it", date: Date(timeInterval: 86400, since: .tomorrow), time: "12:00PM - 2:00 PM", location: "ARC", town: "Kingston", type: "Workout", host: "Codie", invitee: "invitee", message: "Message"))
        data.append(Workout(title: "Full body workout", date: Date(timeInterval: 86400*2, since: .tomorrow), time: "9:30AM - 11:00AM", location: "ARC", town: "Kingston", type: "Workout", host: "Eunice", invitee: "invitee", message: "Message"))
        data.append(Workout(title: "Time to run!", date: Date(timeInterval: 86400*3, since: .tomorrow), time: "TBD", location: "ARC", town: "Kingston", type: "Workout", host: "Graham", invitee: "invitee", message: "Message"))
        
        Data.sharedInstance.workouts = data
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 2 Sections: Coming up and Today
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WorkoutNib
        
        if indexPath.section == 0 {
            // We are in the "Today" section
            cell.loadData(from: today[indexPath.row])
        } else {
            // We are in the "Coming Up" section
            cell.loadData(from: comingUp[indexPath.row])
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return today.count
        }
        
        return comingUp.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeTableViewController {
    @objc func workoutsChanged(_ notification: Notification) {
        self.tableView.reloadData()
    }
}
