//
//  FirstViewController.swift
//  CompletionHandle+ Object ViewControlle data passing
//
//  Created by Muhammad Abdullah Al Mamun on 27/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SVCcalled(_ sender: UIButton) {
        
        let vc = SecondViewController(nibName: "SecondViewController", bundle: nil)
        
        // Set the tightly-coupled property for "Passing Data Back With A Property"
        vc.firstViewController = self
        
     
        
        // Define the closure for "Passing Data Back With A Closure"
        vc.returncompletionHandler = { text in
            
            //print("text = \(text)")
            
            return text.count
        }
        
        
        vc.completionHandler = { get in
            
            print("printGetting value:", get)
            
        }
        
         navigationController?.pushViewController(vc, animated: true)
        
    }//end of button action
    
    
    /**
           This function is invoked from the secondary view controller class,
           for "Passing Data Back With A Property"
      */
      func onUserAction(data: String)
      {
          print("Data received: \(data)")
          
          print("##############################")
      }
      
    
    
}
