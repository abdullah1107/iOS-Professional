//
//  LoginViewController.swift
//  LoginDesign with UITabBar
//
//  Created by Muhammad Abdullah Al Mamun on 28/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginVC")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginbuttonClicked(_ sender: UIButton) {
        
        // set user defaults username
        Defaults.username = "mamun"
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    

}
