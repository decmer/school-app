//
//  ClassView.swift
//  school-app
//
//  Created by Jose Merino Decena on 20/11/24.
//

import SwiftUI
import SwiftData

struct ClassView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var school: [ClassModel]
    
    var body: some View {
        NavigationStack {
            List(school) { school in
                NavigationLink {
                    Text(school.name)
                } label: {
                    ClassPreview(classModel: school)
                }
            }
            .navigationBarTitle("Class")
        }
    }
}

#Preview {
    ClassView()
        .modelContainer(for: SchoolModel.self, inMemory: true)
}
