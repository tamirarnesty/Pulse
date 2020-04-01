//
//  ProfileTableViewController.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-04-01.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var workoutMinutesLabel: UILabel!
    @IBOutlet weak var workoutCollabsLabel: UILabel!
    @IBOutlet weak var workoutCountLabel: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var notificationsSelected = true
    
    var removed = 0
    
    var user: User {
        return DataEngine.shared.user
    }
    var engine: DataEngine {
        return DataEngine.shared
    }
    
    var workoutInvites: [WorkoutInvitation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "pulse_icon.png")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        self.loadData()
        self.loadProfile()

        self.tableView.tableHeaderView = UIView()
        self.tableView.tableHeaderView?.frame.size = headerView.frame.size
        self.tableView.tableFooterView = UIView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(profileDidChange(_:)), name: .profileChanged, object: nil)
    }
    
    func loadProfile() {
        self.profileImageView.image = user.profileImage
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
        self.nameLabel.text = user.name
        self.workoutMinutesLabel.text = String(user.totalWorkoutMinutes)
        self.workoutCollabsLabel.text = String(user.totalCollaborations)
        self.workoutCountLabel.text = String(user.workouts.count)
    }
    
    func loadData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        print("LOADING THE DATA")
        
        for workout in engine.workouts {
            workoutInvites.append(WorkoutInvitation(workout: workout))
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl) {
        self.notificationsSelected.toggle()
        self.tableView.reloadData()
    }
    
    @objc func profileDidChange(_ notification: Notification) {
        self.loadData()
        self.loadProfile()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if notificationsSelected {
            return engine.workouts.count - removed
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !notificationsSelected {
            return 50
        }
        
        if workoutInvites[indexPath.row].expanded {
            return 230
        } else {
            return 90
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
