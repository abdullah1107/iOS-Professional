//
//  DetailsViewController.swift
//  ViewReusableComponent
//
//  Created by Muhammad Abdullah Al Mamun on 6/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController ,AddViewHeader{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewheaderadder(vc: self)
        // Do any additional setup after loading the view.
    }
    
    
    func viewheaderadder(vc: UIViewController) {
        let profileHeader = HeaderViewController(nibName: "HeaderViewController", bundle: nil)
        vc.view.addSubview(profileHeader.view)
        
        vc.addChild(profileHeader)
    }
    
    
    
}
