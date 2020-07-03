//
//  BookDataReprojectory.swift
//  CURD+CoreData
//
//  Created by Muhammad Abdullah Al Mamun on 3/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import Foundation
import CoreData

protocol BookReporojectory {
    func create(bookmodel:BookModel)
    func readAll()->[BookModel]?
    func readOnly(byIdentifier id: UUID) -> BookModel?
    func update(bookmodel:BookModel)->Bool
    func delete(id: UUID)->Bool
}

class BookDataReprojectory:BookReporojectory{

    func create(bookmodel: BookModel) {
        let book = Book(context: PersistentStorage.shared.context)
        book.bookID     = bookmodel.bookID
        book.bookName   = bookmodel.bookName
        book.bookAuthor = bookmodel.bookAuthor
        book.bookImage  = bookmodel.bookImage
        
        PersistentStorage.shared.saveContext()
    }
    
    //all data fetch
    func readAll() -> [BookModel]? {
        
        let bookresult = PersistentStorage.shared.fetchManagerObject(modelObject: Book.self)
        
        var bookmodel : [BookModel] = []
        
        bookresult?.forEach({ (insidebook) in
            bookmodel.append(insidebook.convertToBookModel())
        })
        return bookmodel
    }
    
    //single data entry Fetch
    
    func readOnly(byIdentifier id: UUID) -> BookModel? {
        
//        let fetchRequest = NSFetchRequest<Book>(entityName:"Book")
//        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
//
//        fetchRequest.predicate = predicate
//
//        do {
//            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
//            guard result != nil else {return nil}
//
//            return result?.convertToBookModel()
//        } catch let error {
//            print(error)
//        }
//        return nil
        guard let bdbook = getBookID(byIdentifier: id) else {return nil}
        return bdbook.convertToBookModel()
    }
    
    func update(bookmodel:BookModel) -> Bool {
        
        guard let dbbook = getBookID(byIdentifier: bookmodel.bookID)else{return false}
        
        
        dbbook.bookID = bookmodel.bookID
        dbbook.bookName = bookmodel.bookName
        dbbook.bookAuthor = bookmodel.bookAuthor
        dbbook.bookImage = bookmodel.bookImage
        
        PersistentStorage.shared.saveContext()
        
        return true
        
    }
    
    func delete(id:UUID) -> Bool {
        guard let bdbook = getBookID(byIdentifier: id)else {return false}
        PersistentStorage.shared.context.delete(bdbook)
        PersistentStorage.shared.saveContext()
        
        return true

    }
    
    
}

extension BookDataReprojectory{
    
    private func getBookID(byIdentifier id: UUID) -> Book?
    {
        let fetchRequest = NSFetchRequest<Book>(entityName: "Book")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            
            guard result != nil else {return nil}
            
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
}
