//
//  school_appApp.swift
//  school-app
//
//  Created by Jose Merino Decena on 16/11/24.
//

import SwiftUI
import SwiftData

@main
struct school_appApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SchoolModel.self,
            ClassModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(ViewModel(context: sharedModelContainer.mainContext))
        .modelContainer(sharedModelContainer)
    }
}
