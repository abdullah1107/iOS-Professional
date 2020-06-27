//
//  FirstViewViewController.swift
//  NotificationObserverb
//
//  Created by Muhammad Abdullah Al Mamun on 27/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class FirstViewViewController: UIViewController {
    
    static let notificationName = Notification.Name("simpleNotification")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: FirstViewViewController.notificationName, object: nil)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SCcalled(_ sender: UIButton) {
        
        nextVCwithStoryboardID(storyboardID: "Main", viewController: "SecondViewController")
    }
    
    
    /**
     This function is invoked when the notification is received,
     for "Passing Data With NSNotificationCenter"
     */
    @objc func onNotification(notification:Notification)
    {
        // `userInfo` contains the data you sent along with the notification
        
        print(notification.userInfo as Any)
    }
    
    
    
}


