//
//  SceneDelegate.swift
//  LoginDesign with UITabBar
//
//  Created by Muhammad Abdullah Al Mamun on 28/6/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        //decleare storyboard bundle
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //if having username then
        if let _ = Defaults.username {
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            window?.rootViewController = mainTabBarController
        }
        //if not having username in userDefault then goTo -> LoginViewController
        else{
          let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
            window?.rootViewController = loginNavController
        }
    }
    
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        
        window.rootViewController = vc
        //window.makeKeyAndVisible()
        
        // add animation
        UIView.transition(with: window,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft],
                          animations: nil,
                          completion: nil)
        
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    
}

