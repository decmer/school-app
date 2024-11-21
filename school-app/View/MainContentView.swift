//
//  ContentView.swift
//  school-app
//
//  Created by Jose Merino Decena on 16/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    
    var body: some View {
        
        TabView {
            ListSchoolView().tabItem { Label("Student", systemImage: "house") }.tag(1)
            Text("Tab Calendar").tabItem { Label("Calendar", systemImage: "calendar") }.tag(2)
            Text("Tab Content").tabItem { Label("Setings", systemImage: "gear") }.tag(3)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: SchoolModel.self, inMemory: true)
}
