//
//  FriendTableViewCell.swift
//  Pulse
//
//  Created by Cam Cunningham on 2020-04-01.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
    }
    
    func configure(with friend: Friend) {
        firstNameLabel.text = friend.firstName
        lastNameLabel.text = friend.lastName
        profileImageView.image = friend.profileImage
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
