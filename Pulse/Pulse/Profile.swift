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

    var invites = [WorkoutInvitation]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let invite = WorkoutInvitation(workout: Workout(date: "Thursday Mar 20th", time: "7:00 - 8:30", location: "The Arc", town: "Kingston", type: "Cardio and core", invitee: "Mark"))
        let invite1 = WorkoutInvitation(workout: Workout(date: "Friday Mar 21st", time: "1:15 - 3:00", location: "The Arc", town: "Kingston", type: "Chest and back", invitee: "Kelly"))
        let invite2 = WorkoutInvitation(workout: Workout(date: "Friday Mar 21st", time: "8:30 - 10:00", location: "The Arc", town: "Kingston", type: "Legs", invitee: "Aaron"))
        let invite3 = WorkoutInvitation(workout: Workout(date: "Sunday Mar 23rd", time: "5:00 - 6:00", location: "The Arc", town: "Kingston", type: "Arms", invitee: "Mark"))
        let invite4 = WorkoutInvitation(workout: Workout(date: "Monday Mar 24th", time: "4:45 - 6:00", location: "The Arc", town: "Kingston", type: "Cardio", invitee: "Jill"))
        let invite5 = WorkoutInvitation(workout: Workout(date: "Tuesday Mar 25th", time: "12:00 - 1:45", location: "The Arc", town: "Kingston", type: "Core", invitee: "Emily"))
        let invite6 = WorkoutInvitation(workout: Workout(date: "Wednesday Mar 26th", time: "2:30 - 4:30", location: "The Arc", town: "Kingston", type: "Chest", invitee: "Kelly"))
        
        invites.append(invite)
        invites.append(invite1)
        invites.append(invite2)
        invites.append(invite3)
        invites.append(invite4)
        invites.append(invite5)
        invites.append(invite6)
        //NotificationLayout.estimatedItemSize = CGSize(width: 1, height: 1)
    }
    @IBOutlet weak var SelectorBar: UIView!
    
    @IBAction func WorkoutLogBtn(_ sender: UIButton) {
       /* if notificationsSelected {
            UIView.animate(withDuration: 0.5, animations: {}, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        }*/
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    @IBOutlet weak var NotificationLayout: UICollectionViewFlowLayout!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.invites.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if invites[indexPath.row].expanded
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Expanded Invitation", for: indexPath) as! ProfileWorkoutExpandedCell
            cell.invitee.text = invites[indexPath.row].workout.invitee
            cell.location.text = invites[indexPath.row].workout.location
            cell.time.text = invites[indexPath.row].workout.time
            cell.town.text = invites[indexPath.row].workout.town
            cell.type.text = invites[indexPath.row].workout.type
            //cell.sizeToFit()
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Workout Invitation", for: indexPath) as! ProfileWorkoutCell
            
            cell.date.text = invites[indexPath.row].workout.date + ", " + invites[indexPath.row].workout.time
            cell.invitee.text = "Invited by " + invites[indexPath.row].workout.invitee
            //cell.sizeToFit()
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if !invites[indexPath.row].expanded {
            invites[indexPath.row].expanded = true
            collectionView.reloadItems(at: [indexPath])
        }
        else
        {
            
        }
    }
    /*func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let width : CGFloat
        let height : CGFloat

        if invites[indexPath.row].expanded {
            width = 374
            height = 230
            //collectionView.bounds.height = 230
        } else {
            width = 374
            height = 90
        }
        return CGSize(width: width, height: height)

    }*/
    @IBAction func expand(_ sender: Any) {
        //collectionView.cellForItem(at: <#T##IndexPath#>)
    }
    @IBAction func joinBtn(_ sender: Any) {
        
    }
}

