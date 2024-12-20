//
//  StudentView.swift
//  school-app
//
//  Created by Jose Merino Decena on 17/11/24.
//

import SwiftUI
import SwiftData

struct ListSchoolView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var school: [SchoolModel]
    
    @State var isAdd = false
    
    var searchSchool: [SchoolModel] {
        return school
    }
    
    var body: some View {
        NavigationStack {
            LazyAdapList(preferredWidth: 350) {
                ForEach(school, id: \.self) { item in
                    NavigationLink {
                        SchoolView(institute: item)
                            .environment(item)
                    } label: {
                        SchoolPreview(model: item)
                            .frame(width: 350, height: 200)
                            .padding(.vertical, 12)
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
                SchoolAddView(isPresented: $isAdd)
            }
        }
    }
}

#Preview {
    ListSchoolView()
        .modelContainer(for: SchoolModel.self, inMemory: true)
}
