//
//  ContentView.swift
//  school-app
//
//  Created by Jose Merino Decena on 16/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        
        TabView {
            StudentView().tabItem { Label("Srudent", systemImage: "house") }.tag(1)
            Text("Tab Content 2").tabItem { Label("Setings", systemImage: "gear") }.tag(2)
        }
    }
}

#Preview {
    ContentView()
}
