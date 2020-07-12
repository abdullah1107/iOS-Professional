//
//  ViewController.swift
//  CollectionViewFlowLayout
//
//  Created by Muhammad Abdullah Al Mamun on 12/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var mycollectionView: UICollectionView!
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mycollectionView.delegate   = self
        mycollectionView.dataSource = self
        
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        setupCollectionViewItemSize()
//    }
    
    private func setupCollectionViewItemSize() {
         let numberOfItemPerRow: CGFloat = 2
         let interItemSpacing: CGFloat = 10

         let width = (mycollectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
          
          let height: CGFloat = 180

         collectionViewFlowLayout = UICollectionViewFlowLayout()

         collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
         
         mycollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
    
     }
    
    
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = mycollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //print("calling ....")
        let numberOfItemPerRow: CGFloat = 2.0
        
        let interItemSpacing: CGFloat = 10
        
        let width = (mycollectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
        print(width, mycollectionView.frame.width)
     
        
        return CGSize(width: width, height: 210)
    }
}

