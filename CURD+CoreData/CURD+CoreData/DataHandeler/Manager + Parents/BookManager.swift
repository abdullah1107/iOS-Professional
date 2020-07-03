//
//  BookManager.swift
//  CURD+CoreData
//
//  Created by Muhammad Abdullah Al Mamun on 3/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import Foundation
import CoreData

protocol bookManagerProtocol {
    func createBook(bookmodel: BookModel)
    func readAllBook() -> [BookModel]?
    func readOnlyBook(byIdentifier id: UUID) -> BookModel?
    func updateBook(bookmodel: BookModel) -> Bool
    func deleteBok(id:UUID) -> Bool
}

class BookManager:bookManagerProtocol{
    
    
    
    private let bookDataReprojectory = BookDataReprojectory()
    
    func createBook(bookmodel: BookModel) {
        bookDataReprojectory.create(bookmodel: bookmodel)
    }
    
    func readAllBook() -> [BookModel]? {
        return bookDataReprojectory.readAll()
    }
    
    func readOnlyBook(byIdentifier id: UUID) -> BookModel? {
        return bookDataReprojectory.readOnly(byIdentifier: id)
    }
    
    func updateBook(bookmodel: BookModel) -> Bool {
        return bookDataReprojectory.update(bookmodel: bookmodel)
    }
    
    func deleteBok(id:UUID) -> Bool{
        return bookDataReprojectory.delete(id:id)
    }
    
    
}
