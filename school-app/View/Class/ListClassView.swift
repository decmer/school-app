//
//  ClassView.swift
//  school-app
//
//  Created by Jose Merino Decena on 20/11/24.
//

import SwiftUI
import SwiftData

struct ListClassView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(SchoolModel.self) private var schoolModel
    
    @State private var isAdd: Bool = false
    
    var body: some View {
        NavigationStack {
            LazyAdapList(preferredWidth: 250) {
                ForEach(schoolModel.classModel) { classModel in
                    NavigationLink {
                        ClassView()
                            .environment(classModel)
                    } label: {
                        ClassPreview(classModel: classModel)
                            .frame(width: 250, height: 250)
                    }
                }
            }
            .padding(7)
            .navigationBarTitle("Class")
            .toolbar(content: {
                Button("Add Class") {
                    isAdd = true
                }
            })
            .sheet(isPresented: $isAdd) {
                ClassAddView(isPresented: $isAdd)
            }
        }
    }
}

#Preview {
    do {
        let previewContainer = try ModelContainer(for: SchoolModel.self, ClassModel.self)

        previewContainer.mainContext.insert(Preview.schoolModel)
        previewContainer.mainContext.insert(Preview.classModel1)
        previewContainer.mainContext.insert(Preview.classModel2)

        return ListClassView()
            .modelContainer(previewContainer)
            .environment(Preview.schoolModel)
    } catch {
        return Text("Error: \(error)")
    }
}
