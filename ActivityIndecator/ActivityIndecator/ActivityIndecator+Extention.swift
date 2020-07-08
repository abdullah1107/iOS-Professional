//
//  ActivityIndecator+Extention.swift
//  ActivityIndecator
//
//  Created by Muhammad Abdullah Al Mamun on 9/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import Foundation
import UIKit


class Utils{

static func showActivityIndicator(view: UIView, targetVC: UIViewController) {

    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
//    activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    //full view
    //MARK:- Background
    activityIndicator.backgroundColor = UIColor(red:0.5, green:0.5, blue:0.5, alpha:0.5)
    
    
    activityIndicator.layer.cornerRadius = 1.0
    activityIndicator.center = targetVC.view.center
    activityIndicator.hidesWhenStopped = true
    
    //for activity indecator size
    activityIndicator.style = UIActivityIndicatorView.Style.large
    
    activityIndicator.tag = 1
    view.addSubview(activityIndicator)
    activityIndicator.startAnimating()
    UIApplication.shared.beginReceivingRemoteControlEvents()
    }
    
    static func hideActivityIndicator(view: UIView) {
        let activityIndicator = view.viewWithTag(1) as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        UIApplication.shared.endReceivingRemoteControlEvents()
    }
    
    
}
