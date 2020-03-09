//
//  SecondViewController.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-02-26.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class ProfileController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let notificationsSelected = true

    var invites = [ProfileWorkout]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let invite = ProfileWorkout()
        invite.date = "Thursday Mar 20th, 7:00 - 8:30"
        invite.invitee = "Invited by Mark"
        invites.append(invite)
        let invite1 = ProfileWorkout()
        invite1.date = "Friday Mar 21st, 1:15 - 3:00"
        invite1.invitee = "Invited by Kelly"
        invites.append(invite1)
        let invite2 = ProfileWorkout()
        invite2.date = "Sunday Mar 23rd, 8:30 - 10:00"
        invite2.invitee = "Invited by Aaron"
        invites.append(invite2)
        invites.append(invite2)
        invites.append(invite2)
        invites.append(invite2)
        invites.append(invite2)
    }
    @IBOutlet weak var SelectorBar: UIView!
    
    @IBAction func NotificationBtn(_ sender: UIButton) {
    }
    @IBAction func WorkoutLogBtn(_ sender: UIButton) {
       /* if notificationsSelected {
            UIView.animate(withDuration: 0.5, animations: {}, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        }*/
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.invites.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Workout Invitation", for: indexPath) as! ProfileWorkoutCell
    
        cell.date.text = invites[indexPath.row].date
        cell.invitee.text = invites[indexPath.row].invitee
        cell.sizeToFit()
        
        
        return cell
    }
    @IBAction func expand(_ sender: Any) {
        //collectionView.cellForItem(at: <#T##IndexPath#>)
    }
}

