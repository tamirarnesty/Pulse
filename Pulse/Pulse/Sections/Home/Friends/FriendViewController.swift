//
//  FriendViewController.swift
//  Pulse
//
//  Created by Cam Cunningham on 2020-04-01.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {

    @IBOutlet weak var friendTableView: UITableView!
    
    var friends: [Friend] {
        return DataEngine.shared.friendsList
    }
    var requestsList: [Friend] {
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendTableView.delegate = self
        friendTableView.dataSource = self
        
        friendTableView.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendCell")
        DataEngine.shared.friendsList.append(Friend(firstName: "Cam", lastName: "Cunningham"))
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didPressCloseButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

extension FriendViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataEngine.shared.friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendTableViewCell
        
        cell.configure(with: friends[indexPath.row])
        return cell
    }
    
    
}
