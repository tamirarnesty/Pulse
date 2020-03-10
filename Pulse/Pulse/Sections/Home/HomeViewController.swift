//
//  HomeViewController.swift
//  Pulse
//
//  Created by Tamir Arnesty on 2020-03-10.
//  Copyright © 2020 Tamir Arnesty. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "pulse_icon.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.addButton.layer.cornerRadius = self.addButton.frame.width/2
    }
}
