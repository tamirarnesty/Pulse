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
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var workoutMinutesLabel: UILabel!
    @IBOutlet weak var workoutCollabsLabel: UILabel!
    @IBOutlet weak var workoutCountLabel: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var notificationsSelected = true
    
    var invites = [WorkoutInvitation]()
    var removed = 0
    
    var user: User {
        return DataEngine.shared.user
    }
    var engine: DataEngine {
        return DataEngine.shared
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "pulse_icon.png")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        self.loadData()
        self.loadProfile()

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
            invites.append(WorkoutInvitation(workout: workout))
        }
        
        self.collectionView.reloadData()
    }
    
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl) {
        self.notificationsSelected.toggle()
        self.collectionView.reloadData()
    }
    
    @objc func profileDidChange(_ notification: Notification) {
        self.loadData()
        self.loadProfile()
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if notificationsSelected {
            return engine.workouts.count - removed
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard notificationsSelected else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emptyCell", for: indexPath)
            
            return cell
        }
        
        
        if invites[indexPath.row].expanded {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Expanded Invitation", for: indexPath) as! ProfileWorkoutExpandedCell
            cell.invitee.text = invites[indexPath.row].workout.host.name
            cell.location.text = invites[indexPath.row].workout.location
            cell.time.text = invites[indexPath.row].workout.date.timeOnly
            cell.town.text = invites[indexPath.row].workout.location
            cell.type.text = invites[indexPath.row].workout.type.rawValue
            
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
            
            cell.layer.cornerRadius = 10
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Workout Invitation", for: indexPath) as! ProfileWorkoutCell
            
            cell.date.text = invites[indexPath.row].workout.date.dateOnly + ", " + invites[indexPath.row].workout.date.timeOnly
            cell.invitee.text = "Invited by " + invites[indexPath.row].workout.host.name
            //cell.sizeToFit()
            cell.layer.cornerRadius = 10

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard notificationsSelected else { return }
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        
        if !notificationsSelected {
            return CGSize(width: self.collectionView.frame.width - 10, height: 50)
        }
        
        if invites[indexPath.row].expanded {
            width = self.collectionView.frame.width
            height = 230
            //collectionView.bounds.height = 230
        } else {
            width = self.collectionView.frame.width
            height = 90
        }
        return CGSize(width: width, height: height)    }
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

