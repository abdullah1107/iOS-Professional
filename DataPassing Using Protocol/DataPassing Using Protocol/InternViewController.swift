//
//  InternViewController.swift
//  DataPassing Using Protocol

//  Created by Muhammad Abdullah Al Mamun on 26/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class InternViewController:UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let vc:BossViewController = storyboard.instantiateViewController(withIdentifier: "BossViewController") as! BossViewController
        //here the casting....
        vc.makeCommadobj = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

// command from BossViewContorller
extension InternViewController:MakeaCommand{
    
    func orderToIntern(Command: String?) {
        //function body
        print("hello:",Command ?? "" )
    }
    
}
