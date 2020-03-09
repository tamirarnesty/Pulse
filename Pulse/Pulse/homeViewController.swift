//
//  homeViewController.swift
//  Pulse
//
//  Created by Ellie Sekine on 2020-03-07.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//


import UIKit

class homeViewController: UITableViewController {
    
    var today = ["yo", "yo"]
    var comingUp = ["bro", "bro"]
    
    var headers = ["Today", "Coming Up"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view."
        tableView.register(UINib(nibName: "workout", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
   override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
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
