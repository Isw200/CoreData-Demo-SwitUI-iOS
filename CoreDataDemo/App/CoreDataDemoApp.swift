//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by Isuru Ariyarathna on 2024-11-06.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
