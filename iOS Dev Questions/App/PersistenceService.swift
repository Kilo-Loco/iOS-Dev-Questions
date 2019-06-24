//
//  PersistenceService.swift
//  iOS Dev Questions
//
//  Created by Kyle Lee on 6/22/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import CoreData

/// Responsible for saving data locally to the device
final class PersistenceService {
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "iOS_Dev_Questions")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
