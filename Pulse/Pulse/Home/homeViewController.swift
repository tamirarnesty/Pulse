//
//  homeViewController.swift
//  Pulse
//
//  Created by Ellie Sekine on 2020-03-07.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//


import UIKit

class homeViewController: UITableViewController {
    
    // These will be filled with type workout: Today and Coming up
    
    var today: [Workout] = []
    var comingUp: [Workout] = []
    
    // Headers for the separated table view
    var headers = ["Today", "Coming Up"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view."
        tableView.register(UINib(nibName: "WorkoutNib", bundle: nil), forCellReuseIdentifier: "Cell")
        
        today.append(Workout(title: "Title 1", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee"))
        today.append(Workout(title: "Title 2", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee"))
        comingUp.append(Workout(title: "Title 3", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee"))
        comingUp.append(Workout(title: "Title 4", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee"))
        comingUp.append(Workout(title: "Title 5", date: "Date", time: "Time", location: "Location", town: "Town", type: "type", invitee: "invitee"))
        tableView.reloadData()
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
        var rows = 0
        if section == 0 {
            rows = today.count
        }
        else{
            rows = comingUp.count
        }
        return rows
    }

}
