//
//  DataController.swift
//  CoreDataDemo
//
//  Created by Isuru Ariyarathna on 2024-11-06.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    // initialise
    let container = NSPersistentContainer(name: "ContactsDataModel")
    
    // load data model
    init () {
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
    }
}
