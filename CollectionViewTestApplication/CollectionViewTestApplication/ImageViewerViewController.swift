//
//  ImageViewerViewController.swift
//  CollectionViewTestApplication
//
//  Created by raiyan sharif on 20/7/20.
//  Copyright © 2020 raiyansharif. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        // Do any additional setup after loading the view.
    }
    private func setupImageView(){
        guard let name = imageName else { return }
        
        if let image = UIImage(named: name){
            imageView.image = image
        }
        
    }
    

}
