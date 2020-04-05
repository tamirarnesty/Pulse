//
//  friendsListTableViewController.swift
//  Pulse
//
//  Created by Ellie Sekine on 2020-03-09.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class friendsListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var friendsInvited : [Friend]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataEngine.shared.friendsList.count
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! friendListTableViewCell
        cell.nameLabel.text = (DataEngine.shared.friendsList[indexPath.row].firstName) + " " + (DataEngine.shared.friendsList[indexPath.row].lastName)
        cell.friend = DataEngine.shared.friendsList[indexPath.row]
      
        if cell.isSelected{
            if cell.isSelected == false{
                friendsInvited.append(DataEngine.shared.friendsList[indexPath.row])
            
            
                cell.isSelected = true
            }
            else{
                for i in 0..<friendsInvited.count{
                    if friendsInvited[i].equals(otherFriend: DataEngine.shared.friendsList[indexPath.row]){
                        friendsInvited.remove(at: i)
                    }
                }
                
            print(friendsInvited)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
    
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "friendListTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        // Add a
        DataEngine.shared.addFriend(Friend(firstName: "Ellie", lastName: "Sekine"))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    

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
}
