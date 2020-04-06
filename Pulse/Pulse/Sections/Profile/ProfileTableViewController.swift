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
    
    let emptyCellIdentifier = "EmptyCell"
    let expandedCellIdentifier = "ExpandedInvitationCell"
    let invitationCellIdentifier = "InvitationCell"
    
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
        
        //        self.tableView.tableHeaderView = UIView()
        //        self.tableView.tableHeaderView?.frame.size = headerView.frame.size
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
            workoutInvites.append(WorkoutInvitation.generateWorkout(from: workout))
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
            return workoutInvites.count - removed
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !notificationsSelected {
            return 50
        }
        
        if workoutInvites[indexPath.row].isExpanded {
            return 230
        } else {
            return 90
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if !notificationsSelected {
            let cell = tableView.dequeueReusableCell(withIdentifier: emptyCellIdentifier, for: indexPath)
            return cell
        }
        
        
        if workoutInvites[indexPath.row].isExpanded {
            let cell = tableView.dequeueReusableCell(withIdentifier: expandedCellIdentifier, for: indexPath) as! ProfileWorkoutExpandedCell
            cell.configure(with: workoutInvites[indexPath.row])
            cell.choiceSelectedClosure = { [unowned self] in
                if let indexPath = self.tableView.indexPath(for: cell) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                        self.tableView.beginUpdates()
                        self.workoutInvites.remove(at: indexPath.row)
                        self.tableView.deleteRows(at: [indexPath], with: .fade)
                        self.tableView.endUpdates()
                    }
                }
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: invitationCellIdentifier, for: indexPath) as! ProfileWorkoutCell
            cell.configure(with: workoutInvites[indexPath.row])
            cell.expandClosure = { [unowned self] in
                if let indexPath = self.tableView.indexPath(for: cell) {
                    self.tableView.beginUpdates()
                    self.workoutInvites[indexPath.row].isExpanded = true
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                    self.tableView.endUpdates()
                }
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if !notificationsSelected {
            return nil
        }
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if workoutInvites[indexPath.row].isExpanded {
            workoutInvites[indexPath.row].isExpanded.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
