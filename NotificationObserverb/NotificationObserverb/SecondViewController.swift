//  SecondViewController.swift
//  NotificationObserverb

//  Created by Muhammad Abdullah Al Mamun on 27/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendBackNotification(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: FirstViewViewController.notificationName, object: nil, userInfo:["data": "Mamun", "isImportant": true])
    }
    
}
