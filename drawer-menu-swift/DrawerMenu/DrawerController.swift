//
//  DrawerController.swift
//  iosapptemplates.com
//
//  Created by Muhammad Abdullah Al Mamun on 14/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.

import UIKit
import Foundation

class DrawerController: UIViewController, RootViewControllerDelegate {
    
    var rootViewController: RootViewController
    var menuController: MenuViewController
    var isMenuExpanded: Bool = false
    let overlayView = UIView()
    
    
    
    init(rootViewController: RootViewController, menuController: MenuViewController) {
        self.rootViewController = rootViewController
        self.menuController = menuController
        super.init(nibName: nil, bundle: nil)
        self.rootViewController.drawerDelegate = self
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //tableVeiw section
    enum CellIdentifiers {
        static let identifier = "cell"
    }
    
    var customtableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customtableview.delegate = self
        customtableview.dataSource = self
        customtableview.register(UINib.init(nibName: "DrawerCell", bundle: nil), forCellReuseIdentifier: "DrawerCell")
        
        setRootView()
        setMenuController()
        configureGestures()
        customtableview.reloadData()
    }
    
    
    
    
    
    func setRootView(){
        self.addChild(rootViewController)
        self.view.addSubview(rootViewController.view)
        rootViewController.didMove(toParent: self)
        
        overlayView.backgroundColor = .black
        overlayView.alpha = 0
        view.addSubview(overlayView)
    }
    
    func setMenuController(){
        
        self.menuController.view.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height)
        self.addChild(menuController)
        //setupMenuController(mc: self.menuController.view)
        customtableview.frame = CGRect(x:0, y:0, width:0, height:self.view.bounds.height)
        menuController.view.addSubview(customtableview)

        self.view.addSubview(menuController.view)
        menuController.didMove(toParent: self)
    }
    
//    func setupMenuController(mc:UIView){
//        customtableview.frame = CGRect(x:0, y:150, width:mc.frame.width, height:mc.frame.height)
//        customtableview.delegate = self
//        customtableview.dataSource = self
//        customtableview.backgroundColor = UIColor(red: 31/255.0, green: 69/255.0, blue: 106/255.0, alpha: 1.0) //rgb(31,69,106)
//        mc.addSubview(customtableview)
//        self.view.addSubview(mc)
//        //customtableview.reloadData()
//
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        overlayView.frame = view.bounds
        let width: CGFloat = (isMenuExpanded) ? view.bounds.width * 2.2 / 3 : 0.0
        self.menuController.view.frame = CGRect(x: 0, y: 0, width: width , height: self.view.bounds.height)
        customtableview.frame = CGRect(x:0, y:0, width:menuController.view.frame.width, height:menuController.view.frame.height)
       
        customtableview.backgroundColor = UIColor(red: 31/255.0, green: 69/255.0, blue: 106/255.0, alpha: 1.0) //rgb(31,69,106)
        self.menuController.view.addSubview(customtableview)
        customtableview.reloadData()
    }
    
    func toggleMenu() {
        isMenuExpanded = !isMenuExpanded
        let bounds = self.view.bounds
        let width: CGFloat = (isMenuExpanded) ? bounds.width * 2 / 3 : 0.0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.customtableview.frame = CGRect(x: 0, y: 0, width: width, height: bounds.height)
            self.overlayView.alpha = (self.isMenuExpanded) ? 0.5 : 0.0
        }) { (success) in
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.menuController.view.frame = CGRect(x: 0, y: 0, width: width, height: bounds.height)
            self.overlayView.alpha = (self.isMenuExpanded) ? 0.5 : 0.0
        }) { (success) in
        }
    }
    
    func navigateTo(viewController: UIViewController) {
        rootViewController.setViewControllers([viewController], animated: true)
        self.toggleMenu()
    }
    
    fileprivate func configureGestures() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeLeftGesture.direction = .left
        overlayView.addGestureRecognizer(swipeLeftGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOverlay))
        overlayView.addGestureRecognizer(tapGesture)
    }
    
    @objc fileprivate func didSwipeLeft() {
        toggleMenu()
    }
    
    @objc fileprivate func didTapOverlay() {
        toggleMenu()
    }
}

extension DrawerController {
    func rootViewControllerDidTapMenuButton(_ rootViewController: RootViewController) {
        toggleMenu()
    }
}

extension DrawerController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }
}

extension DrawerController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:DrawerCell = tableView.dequeueReusableCell(withIdentifier: "DrawerCell", for: indexPath) as! DrawerCell
        
        return cell
    }
    
    
}
