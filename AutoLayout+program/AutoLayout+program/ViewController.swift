//
//  ViewController.swift
//  AutoLayout+program
//
//  Created by Muhammad Abdullah Al Mamun on 10/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy var redView   = UIView()
    lazy var blueView  = UIView()
    lazy var greenView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        blueView.backgroundColor = .blue
        fullsuperView(to: blueView)
        view.addSubview(blueView)
        // Do any additional setup after loading the view.
    }

   

}
extension ViewController{
    func fullsuperView(to parent:UIView){
        parent.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor).isActive = true
         parent.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor).isActive = true
        parent.heightAnchor.constraint(equalTo:parent.safeAreaLayoutGuide.heightAnchor).isActive = true
        
        parent.widthAnchor.constraint(equalTo:parent.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        
        
    }
}


