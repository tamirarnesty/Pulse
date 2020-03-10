//
//  ProfileViewController.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-02-26.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var SelectorBar: UIView!
    @IBOutlet weak var NotificationLayout: UICollectionViewFlowLayout!
    
    let notificationsSelected = true
    
    var invites = [WorkoutInvitation]()
    var removed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "pulse_icon.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.loadData()
        
        //NotificationLayout.estimatedItemSize = CGSize(width: 1, height: 1)
    }
    
    func loadData() {
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
        
        print("LOADING THE DATA")
        for invite in invites {
            print(invite.workout.time)
        }

    }
    @IBAction func WorkoutLogBtn(_ sender: UIButton) {
        /* if notificationsSelected {
         UIView.animate(withDuration: 0.5, animations: {}, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
         }*/
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.invites.count - removed
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if invites[indexPath.row].expanded
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Expanded Invitation", for: indexPath) as! ProfileWorkoutExpandedCell
            cell.invitee.text = invites[indexPath.row].workout.invitee
            cell.location.text = invites[indexPath.row].workout.location
            cell.time.text = invites[indexPath.row].workout.time
            cell.town.text = invites[indexPath.row].workout.town
            cell.type.text = invites[indexPath.row].workout.type
            //cell.sizeToFit()
            if invites[indexPath.row].responded {
                if invites[indexPath.row].accepted {
                    cell.joined = true
                    cell.joinBtnText.setTitle("Joined", for: UIControl.State.normal)
                    cell.joinBtnText.isEnabled = false
                    cell.declineBtnText.isHidden = true
                    cell.declineBackground.isHidden = true
                } else {
                    cell.declineBtnText.setTitle("Declined", for: UIControl.State.normal)
                    cell.declineBtnText.isEnabled = false
                    cell.joinBtnText.isHidden = true
                    cell.joinBackground.isHidden = true
                    cell.declined = true
                }
            } else {
                cell.declineBtnText.isHidden = false
                cell.declineBtnText.isEnabled = true
                cell.declineBackground.isHidden = false
                cell.joinBackground.isHidden = false
                cell.joinBtnText.isEnabled = true
                cell.joinBtnText.isHidden = false
                cell.declineBtnText.setTitle("Decline", for: UIControl.State.normal)
                cell.joinBtnText.setTitle("Join", for: UIControl.State.normal)
                cell.joined = false
                cell.declined = false
            }
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
            collectionView.reloadData()//Items(at: [indexPath])
        }
        else
        {
            guard let cell = collectionView.cellForItem(at: indexPath) as? ProfileWorkoutExpandedCell else {return}
            if cell.joined {
                invites[indexPath.row].accepted = true
                invites[indexPath.row].responded = true
                invites.remove(at: indexPath.row)
                collectionView.deleteItems(at: [indexPath])
            }
            else if cell.declined {
                invites[indexPath.row].accepted = false
                invites[indexPath.row].responded = true
                invites.remove(at: indexPath.row)
                collectionView.deleteItems(at: [indexPath])
                
                
                
            }
            collectionView.reloadData()
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
}

