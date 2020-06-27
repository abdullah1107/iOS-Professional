//
//  BossViewController.swift
//  DataPassing Using Protocol
//
//  Created by Muhammad Abdullah Al Mamun on 26/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

protocol MakeaCommand {
    func orderToIntern(Command:String?)
}

class BossViewController: UIViewController {
    
    var makeCommadobj:MakeaCommand?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        callingFunctionInsideBoss()
    }
    
}
extension BossViewController{
    
    func callingFunctionInsideBoss() {
        //print("inside!!!")
        //function body
      makeCommadobj?.orderToIntern(Command: "DonetheJob!!!")
     
    }
}
