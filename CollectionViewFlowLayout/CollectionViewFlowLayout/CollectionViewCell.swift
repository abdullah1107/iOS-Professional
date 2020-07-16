//
//  CollectionViewCell.swift
//  CollectionViewFlowLayout
//
//  Created by Muhammad Abdullah Al Mamun on 12/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellVIew: UIView!
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
           cellVIew.layer.cornerRadius = 10
       }
    
}
