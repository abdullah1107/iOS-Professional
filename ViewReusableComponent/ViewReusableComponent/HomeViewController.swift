//
//  ViewController.swift
//  ViewReusableComponent
//
//  Created by Muhammad Abdullah Al Mamun on 6/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

protocol AddViewHeader {
    func viewheaderadder(vc:UIViewController)
}

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.viewheaderadder(vc: self)
    
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        //this is inside
        print("hello button CLicked")
    }
    

}

extension HomeViewController:AddViewHeader{
    
    func viewheaderadder(vc: UIViewController) {
        let profileHeader = HeaderViewController(nibName: "HeaderViewController", bundle: nil)
        vc.view.addSubview(profileHeader.view)

        vc.addChild(profileHeader)
    }
    
    
}
