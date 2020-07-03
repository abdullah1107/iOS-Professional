//
//  Book+CoreDataProperties.swift
//  CURD+CoreData
//
//  Created by Muhammad Abdullah Al Mamun on 2/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var bookName: String?
    @NSManaged public var bookID: UUID?
    @NSManaged public var bookAuthor: String?
    @NSManaged public var bookImage: Data?
    
    func convertToBookModel() -> BookModel
       {
        return BookModel(bookName: bookName, bookAuthor: bookAuthor, bookImage:bookImage, bookID: bookID!)
       }

}
