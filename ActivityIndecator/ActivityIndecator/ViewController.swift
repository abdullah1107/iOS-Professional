//
//  ViewController.swift
//  ActivityIndecator
//
//  Created by Muhammad Abdullah Al Mamun on 9/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //calling showActivityindecator
        Utils.showActivityIndicator(view: self.view, targetVC: self)
        

        //this method for stop activity indecator
        loadDatafromserver(view: self.view)
    }

    func loadDatafromserver(view:UIView){
        DispatchQueue.main.async {
           
            Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (t) in
                
                Utils.hideActivityIndicator(view: view)
            }
           
            
        }
    }

}

