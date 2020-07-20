//
//  ViewController.swift
//  CollectionViewTestApplication
//
//  Created by raiyan sharif on 20/7/20.
//  Copyright © 2020 raiyansharif. All rights reserved.
//

import UIKit


struct Item{
    var imageName: String
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var item: [Item] = [Item(imageName: "1"),
                        Item(imageName: "2"),
                        Item(imageName: "3"),
                        Item(imageName: "4"),
                        Item(imageName: "5"),
                        Item(imageName: "6"),
                        Item(imageName: "7"),
                        Item(imageName: "8"),
                        Item(imageName: "9"),
                        Item(imageName: "10"),
                        Item(imageName: "11"),
                        Item(imageName: "12"),
                        Item(imageName: "13"),
                        Item(imageName: "14"),
                        Item(imageName: "15")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "GallaryItemCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "GallaryItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
    }
    
    private func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberOFItemPerRow: CGFloat = 5
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            
            let width = (collectionView.frame.width - (numberOFItemPerRow - 1) * interItemSpacing) / numberOFItemPerRow
            let height = width
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
            
            
            
        }
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GallaryItemCollectionViewCell
        cell.imageView.image = UIImage(named: item[indexPath.item].imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    
}

