//
//  StudentView.swift
//  school-app
//
//  Created by Jose Merino Decena on 17/11/24.
//

import SwiftUI
import SwiftData

struct StudentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var school: [SchoolModel]
    
    @State var isAdd = false
    
    var searchSchool: [SchoolModel] {
        return school
    }
    
    var body: some View {
        NavigationStack {
            LazyAdapList(preferredWidth: 200) {
                ForEach(school, id: \.self) { item in
                    NavigationLink {
                        SchoolView(institute: item)
                    } label: {
                        SchoolPreview(model: item)
                            .frame(width: 300, height: 300)
                    }
                }
                
            }
            .navigationTitle("Schools")
            
            .toolbar {
                Button("Add") {
                    isAdd = true
                }
            }
            .sheet(isPresented: $isAdd) {
                SchoolAddView()
            }
        }
    }
}

#Preview {
    StudentView()
        .modelContainer(for: SchoolModel.self, inMemory: true)
}
