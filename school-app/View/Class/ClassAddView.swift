//
//  ClassAddView.swift
//  school-app
//
//  Created by Jose Merino Decena on 20/11/24.
//

import SwiftUI
import SwiftData

struct ClassAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(SchoolModel.self) private var schoolModel
    
    @State private var name: String = ""
    @State private var color: Color = .white

    @Binding var isPresented: Bool

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                Form {
                    Section {
                        TextField("Name", text: $name)
                    }
                    
                    Section {
                        ColorPicker("Color", selection: $color)
                    }
                }
                
            }
            .toolbar(content: {
                Button("Create") {
                    if let cgColor = UIColor(color).cgColor.copyConvertedToSRGB() {
                        color = Color(cgColor)
                    }
                    let schoolAux = ClassModel(id: .init(), schoolModel: schoolModel, activitiesModel: [], teachersModel: [], name: name, timePerWeek: 4, colorHex: color.toHex()!)
                    modelContext.insert(schoolAux)
                    do {
                        try modelContext.save()
                    } catch {
                        print("Error al guardar: \(error.localizedDescription)")
                    }
                    isPresented = false
                }
            })
        }
    }
}

#Preview {
    do {
        let previewContainer = try ModelContainer(for: SchoolModel.self, ClassModel.self)

        previewContainer.mainContext.insert(Preview.schoolModel)
        previewContainer.mainContext.insert(Preview.classModel1)
        previewContainer.mainContext.insert(Preview.classModel2)

        return ClassAddView(isPresented: Bool.$trueState)
            .modelContainer(previewContainer)
            .environment(Preview.schoolModel)
    } catch {
        return Text("Error: \(error)")
    }
}
