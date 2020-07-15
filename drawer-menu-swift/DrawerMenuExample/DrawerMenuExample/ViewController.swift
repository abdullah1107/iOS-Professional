//
//  ViewController.swift
//  DrawerMenuExample
//
//  Created by Muhammad Abdullah Al Mamun on 14/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.

import UIKit

let myarray = ["Home", "Detail","Custom"]

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupsideMenu()
        
    }
}




extension ViewController{
    func setupsideMenu(){
        let mainVC = UIViewController()
        mainVC.view.backgroundColor = .white
        
        let rootController = RootViewController(mainViewController: mainVC, topNavigationLeftImage: UIImage(named: "hamburger-menu-icon"))
        
        let menuVC = MenuViewController()
        menuVC.view.backgroundColor = .lightGray
        
        let drawerVC = DrawerController(rootViewController: rootController, menuController: menuVC)
        self.addChild(drawerVC)
        view.addSubview(drawerVC.view)
        drawerVC.didMove(toParent: self)
    }
}
