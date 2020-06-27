//
//  extentions.swift
//  NotificationObserverb
//
//  Created by Muhammad Abdullah Al Mamun on 28/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
 
        func nextVCwithStoryboardID(storyboardID: String, viewController: String) {
           let storyboard = UIStoryboard(name: storyboardID, bundle: nil)
           let vc = storyboard.instantiateViewController(withIdentifier: "\(viewController)")
          navigationController?.pushViewController(vc, animated: true)
       }
}
