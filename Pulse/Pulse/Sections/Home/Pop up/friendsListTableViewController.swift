//
//  friendsListTableViewController.swift
//  Pulse
//
//  Created by Ellie Sekine on 2020-03-09.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class friendsListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var friendsInvited: [Friend] {
        set {
            DataEngine.shared.invitedFriends = newValue
        }
        get {
            return DataEngine.shared.invitedFriends
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "friendListTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataEngine.shared.friendsList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! friendListTableViewCell
        cell.nameLabel.text = (DataEngine.shared.friendsList[indexPath.row].firstName) + " " + (DataEngine.shared.friendsList[indexPath.row].lastName)
        cell.friend = DataEngine.shared.friendsList[indexPath.row]
        
//        if cell.isSelected {
//            for i in 0..<friendsInvited.count{
//                let otherFriend = DataEngine.shared.friendsList[indexPath.row]
//                if friendsInvited[i] == otherFriend {
//                    friendsInvited.remove(at: i)
//                }
//            }
//
////            print(friendsInvited)
//        } else {
//            friendsInvited.append(DataEngine.shared.friendsList[indexPath.row])
//
//            cell.isSelected = true
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
        let cell = tableView.cellForRow(at: indexPath) as! friendListTableViewCell
        
        if !friendsInvited.contains(cell.friend) {
            var newFriends = friendsInvited
            newFriends.append(cell.friend)
            friendsInvited = newFriends
        } else {
            var newFriends = friendsInvited
            let index = newFriends.firstIndex(of: cell.friend)
            newFriends.remove(at: index!)
            friendsInvited = newFriends
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
