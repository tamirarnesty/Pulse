//
//  FriendsTableViewController.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-04-01.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    var friends: [Friend] {
        return DataEngine.shared.friendsList
    }
    var requestsList: [Friend] {
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendCell")
        
        DataEngine.shared.addFriend(Friend(firstName: "Cam", lastName: "Cunningham"))
    }
    
    @IBAction func didTapDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl) {
        self.tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            guard !friends.isEmpty else {
                return 1
            }
            
            return friends.count
        }
        
        guard !requestsList.isEmpty else {
            return 1
        }
        
        return requestsList.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentedControl.selectedSegmentIndex == 0 {
            if friends.isEmpty {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell")!
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendTableViewCell
            
            cell.configure(with: friends[indexPath.row])
            return cell
        }
        
        if requestsList.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyRequestCell")!
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendTableViewCell
        
        cell.configure(with: requestsList[indexPath.row])
        return cell
    }
}
