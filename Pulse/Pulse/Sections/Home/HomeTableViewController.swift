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
        today.append(Workout(title: "Title 1", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee", message: "Message"))
        
        // Reload the table
        tableView.reloadData()
        
        self.loadData()
    }
    
    func loadData() {
        var data: [Workout] = []
        data.append(Workout(title: "Title 1", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee", message: "Message"))
        data.append(Workout(title: "Title 1", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee", message: "Message"))
        data.append(Workout(title: "Title 1", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee", message: "Message"))
        data.append(Workout(title: "Title 1", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee", message: "Message"))
        data.append(Workout(title: "Title 1", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee", message: "Message"))
        
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
            cell.titleLabel.text = today[indexPath.row].title
        } else {
            // We are in the "Coming Up" section
            cell.titleLabel.text = comingUp[indexPath.row].title
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return today.count
        }
        
        return comingUp.count
    }

}

extension HomeTableViewController {
    @objc func workoutsChanged(_ notification: Notification) {
        self.tableView.reloadData()
    }
}
