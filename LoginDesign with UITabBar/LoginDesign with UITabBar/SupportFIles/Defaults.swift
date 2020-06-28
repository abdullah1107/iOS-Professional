//
//  Defaults.swift
//  LoginDesign with UITabBar
//
//  Created by Muhammad Abdullah Al Mamun on 28/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import Foundation

class Defaults {
    
    class var username : String? {
        get {
            // #function means the function name, or in this case, the variable name,
            // which is "username"
            return UserDefaults.standard.string(forKey: #function)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
}
