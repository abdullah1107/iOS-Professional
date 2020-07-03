//
//  PersistentStorage.swift
//  CURD+CoreData
//
//  Created by Muhammad Abdullah Al Mamun on 2/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import Foundation
import CoreData

//singleTon
final class PersistentStorage{
    
    static let shared = PersistentStorage()
    
    private init() {
        //nothing
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CURD_CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func fetchManagerObject<T:NSManagedObject>(modelObject:T.Type) -> [T]? {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(modelObject.fetchRequest()) as? [T] else { return nil }
            
            return result
        } catch let error {
            print(error)
        }
       return nil
        
    }
    
}


