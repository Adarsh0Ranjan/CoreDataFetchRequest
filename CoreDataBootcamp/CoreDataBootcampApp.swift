//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Adarsh Ranjan on 29/12/24.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
