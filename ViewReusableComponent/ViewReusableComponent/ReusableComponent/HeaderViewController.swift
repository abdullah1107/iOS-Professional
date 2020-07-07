//
//  HeaderViewController.swift
//  ViewReusableComponent
//
//  Created by Muhammad Abdullah Al Mamun on 6/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

enum Rounder{
    
    static func roundImage(profileImage:UIImageView){
        profileImage.backgroundColor = UIColor.white
        profileImage.layer.cornerRadius = profileImage.frame.size.width/4
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
    }
}

class HeaderViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //round image shape
        Rounder.roundImage(profileImage: profileImage)

    }

}
 


