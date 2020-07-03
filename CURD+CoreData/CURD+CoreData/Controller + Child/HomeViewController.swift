//
//  HomeViewController.swift
//  CURD+CoreData
//
//  Created by Muhammad Abdullah Al Mamun on 2/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    private let manager:BookManager = BookManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
              debugPrint(path[0])
        
        //MARK:- just only call manager class method 
    
//       let bookobj = BookModel(bookName: <#T##String?#>, bookAuthor: <#T##String?#>, bookImage: <#T##Data?#>, bookID: UUID())
//       
//        manager.createBook(bookmodel: bookobj)
        
    }
    


}
//extension HomeViewController{
//
//    func createaNewBook(){
//        let newbook = Book(context:PersistentStorage.shared.context)
//        newbook.bookName = "amar bangla"
//        newbook.bookAuthor = "abdullah"
//        newbook.bookImage = UIImage(named: "pic") as? Data
//        PersistentStorage.shared.saveContext()
//    }
//
//    func fetchTheData(){
//
//        do {
//            guard let result = try PersistentStorage.shared.context.fetch(Book.fetchRequest()) as? [Book] else {return}
//
//            result.forEach({debugPrint($0.bookImage)})
//
//
//        } catch let error
//        {
//            debugPrint(error)
//        }
//    }
//}
