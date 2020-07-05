//
//  ViewController.swift
//  UIButton+UIKit
//  Created by Muhammad Abdullah Al Mamun on 5/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // button declearation
    lazy var button:UIButton = {
        var button = UIButton(frame: CGRect(x:100, y: 100, width: 150, height: 170))
        button.setTitle("Hello, World!", for: .normal)
        button.titleLabel?.font = UIFont(name: "YourFontName", size: 20)
        //button.setImage(UIImage(named:"test-image"), for: .normal)
        //button.setImage(UIImage(named:"test-image"), for:[.selected, .highlighted])
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        //Swift
        button.setTitleColor(.blue, for: .normal)
        
        // Get UIButton's size strictly based on its text and font
        //button.intrinsicContentSize.width
      
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(someButtonAction), for: .touchUpInside)
        view.addSubview(button)
        
        //Align contents to the left of the frame
        //button.contentHorizontalAlignment = .left //Align contents to the right of the frame
        //button.contentHorizontalAlignment = .right //Align contents to the center of the frame
        //button.contentHorizontalAlignment = .center
        //Make contents fill the frame
        //button.contentHorizontalAlignment = .fill
    }

    @objc func someButtonAction(){
        print("button Clicked!!!")
    }

}

extension ViewController{
    
}
