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
        return DataEngine.shared.workouts
    }
    
    // Headers for the separated table view
    var headers = ["Today", "Coming Up"]
    var previousSelectedIndex: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view."
        
        // Register the nib
        tableView.register(UINib(nibName: "WorkoutNib", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tableView.register(UINib(nibName: "SectionHeaderView", bundle: .main), forHeaderFooterViewReuseIdentifier: "SectionHeaderView")

        // Test data: Append a workout to today
        today.append(Workout(title: "Workout with Steve", date: Date(), duration: 60, location: "The ARC",  host: Friend(firstName: "Mark", lastName: "Stevenson"), invitees: []))

        // Reload the table
        tableView.reloadData()
        NotificationCenter.default.addObserver(self, selector: #selector(workoutsChanged(_:)), name: .homeChanged, object: nil)
        self.loadData()
        
    }
    
    func loadData() {
        var data: [Workout] = []

        data.append(Workout(title: "Workout with Steve", date: Date(timeIntervalSinceNow: 86400), duration: 60, location: "The ARC", host: Friend(firstName: "Mark", lastName: "Stevenson"), invitees: []))
        data.append(Workout(title: "Workout with Steve", date: Date(timeInterval: 86400, since: .tomorrow), duration: 60, location: "The ARC",  host: Friend(firstName: "Mark", lastName: "Stevenson"), invitees: []))
        data.append(Workout(title: "Workout with Steve", date: Date(timeInterval: 86400*2, since: .tomorrow), duration: 60, location: "The ARC",  host: Friend(firstName: "Mark", lastName: "Stevenson"), invitees: []))
        data.append(Workout(title: "Workout with Steve", date: Date(timeInterval: 86400*2, since: .tomorrow), duration: 60, location: "The ARC",  host: Friend(firstName: "Mark", lastName: "Stevenson"), invitees: []))
        
        DataEngine.shared.workouts = data
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 2 Sections: Coming up and Today
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeaderView") as! SectionHeaderView
        view.label.text = headers[section]
//        view.label.font = UIFont.preferredFont(forTextStyle: .title3)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
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
        
        if let index = previousSelectedIndex {
            if index == indexPath {
                tableView.deselectRow(at: index, animated: true)
                previousSelectedIndex = nil
            }
        } else {
            previousSelectedIndex = indexPath
        }
    }
}

extension HomeTableViewController {
    @objc func workoutsChanged(_ notification: Notification) {
        self.tableView.reloadData()
    }
    
    
}
