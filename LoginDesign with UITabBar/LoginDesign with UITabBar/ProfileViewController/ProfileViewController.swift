//
//  ProfileViewController.swift
//  LoginDesign with UITabBar
//
//  Created by Muhammad Abdullah Al Mamun on 28/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Profile VC")

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        // set user defaults username
        Defaults.username = nil
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
    
}
