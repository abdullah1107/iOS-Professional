//
//  SecondViewController.swift
//  CompletionHandle+ Object ViewControlle data passing
//
//  Created by Muhammad Abdullah Al Mamun on 27/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var firstViewController:FirstViewController?
    
    var completionHandler:((String)->(Void))?
    
    var returncompletionHandler:((String) -> Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func callback(_ sender: UIButton) {
        
        // Call the tightly-coupled onUserAction(data:) function for "Passing data back with properties"
        firstViewController?.onUserAction(data: "Hello i am from secondViewController")
        
        completionHandler?("called from SVC inside completionHandler")
        
        let result = returncompletionHandler?("called from SVC inside completionHandler")
        print(result ?? 0)
    }
}
