//
//  ViewController.swift
//  UILabel+UiKit
//
//  Created by Muhammad Abdullah Al Mamun on 3/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //decleare a label
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Muhammad Mamun"
        label.textColor = UIColor.green
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //setLabel()
        view.addSubview(nameLabel)
        setLabelwithAutoLayout()
       // myfunction()
        
        
        
    }
    
    
}
extension ViewController{
    
    func setLabel(){
//        let frame = CGRect(x:25, y:150, width: 200, height: 21)
//        let label = UILabel(frame: frame)
//        label.textColor = UIColor.red
//        label.text = "My Name is Mamun"
//        view.addSubview(label)
        
//        let labelOne = UILabel(frame: CGRect(x:25, y:150, width: 200, height: 21))
//        labelOne.backgroundColor = UIColor.blue
//        labelOne.textColor = UIColor.white
//        labelOne.text = "Hello, World!"
//        labelOne.sizeToFit()
//        view.addSubview(labelOne)
        
        
        let sampleText = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        // Create label
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 400))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        // Justify text through paragraph style
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.justified
        
        let attributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.baselineOffset: NSNumber(value: 0)]
        let attributedString = NSAttributedString(string: sampleText, attributes: attributes); label.attributedText = attributedString
        view.addSubview(label)
    }
    
    func setLabelwithAutoLayout(){
        let label = UILabel()
        //label.backgroundColor = .red
        label.text = "Another label"
        label.textColor = .red
        view.addSubview(label)
        

        myclass.configureAuftolayout(label: label, top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 125, height: 0))
        myclass.configureAuftolayout(label: nameLabel, top: label.bottomAnchor, leading: nil, bottom: nil, trailing: label.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
    }
    
   

}

