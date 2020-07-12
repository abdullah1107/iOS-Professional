//
//  Utilits.swift
//  ScrollView+Programmitically
//
//  Created by Muhammad Abdullah Al Mamun on 9/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import Foundation
import UIKit
let scrollView = UIScrollView()
class Config{
    
    static func setupScrollView(contentView:UIView, parentView:UIView){
        
     
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        parentView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: parentView.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
