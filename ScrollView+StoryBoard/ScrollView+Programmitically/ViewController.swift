//
//  ViewController.swift
//  ScrollView+Programmitically
//
//  Created by Muhammad Abdullah Al Mamun on 9/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

// in StoryBoard should change Content LayoutGuide Uncheck
// In storyboard

import UIKit

class ViewController: UIViewController {
    
//    var topView: UIView!
//    var bottomView: UIView!
    var scrollView:UIScrollView = UIScrollView()
    var contentView:UIView =  UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

      //  let screenSize = UIScreen.main.bounds

//        self.topView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 100))
//        self.bottomView = UIView(frame: CGRect(x: 0, y: 100, width: screenSize.width, height: screenSize.height - 100))
//        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: screenSize.width, height: screenSize.height + 100))
//        self.contentView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 3))
//
//        topView.backgroundColor = .red
//        bottomView.backgroundColor = .green
//        self.view.backgroundColor = .white
//        self.view.addSubview(self.scrollView)
//        self.contentView.addSubview(topView)
//        self.contentView.addSubview(bottomView)
//        //self.view.addSubview(self.topView)
//        //self.view.addSubview(self.bottomView)
//        //self.bottomView.addSubview(self.scrollView)
//        self.scrollView.addSubview(self.contentView)
//
//        //self.bottomView.clipsToBounds = true
//
//        //self.view.backgroundColor = .white
//        self.scrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height * 3)
        //self.contentView.backgroundColor = .gray
        
        
//        setupScrollView(contentView: contentView, view:self.view)
//        
//        setupViews(contentView: contentView)
        
       
    }
    
    func setupScrollView(contentView:UIView, view:UIView){
        
        let screenSize = UIScreen.main.bounds
          scrollView.translatesAutoresizingMaskIntoConstraints = false
          contentView.translatesAutoresizingMaskIntoConstraints = false
         scrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height * 3)
          
          view.addSubview(scrollView)
          scrollView.addSubview(contentView)
          
          scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          
          contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
          contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
          contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
          contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
       
      }
    
    

    func setupViews(contentView:UIView){
        //print("heeo")
        contentView.addSubview(label1)
        label1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 4/4).isActive = true
        
        contentView.addSubview(label2)
        label2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 25).isActive = true
        label2.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 4/4).isActive = true
        label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    let label1: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.............."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

}

