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
    @State private var timePerWeek: Int = 1 // Valor predeterminado para horas por semana

    @Binding var isPresented: Bool

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                Form {
                    // Sección para el nombre de la clase
                    Section(header: Text("Class Details")) {
                        TextField("Name", text: $name)
                    }
                    
                    // Sección para elegir el color
                    Section(header: Text("Color")) {
                        ColorPicker("Color", selection: $color)
                    }
                    
                    // Sección para horas por semana
                    Section(header: Text("Time Per Week")) {
                        Stepper(value: $timePerWeek, in: 1...40) {
                            Text("\(timePerWeek) hour(s) per week")
                        }
                    }
                }
            }
            .navigationTitle("Add Class")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") {
                        createClass()
                    }
                    .disabled(name.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
        }
    }
    
    private func createClass() {
        if let cgColor = UIColor(color).cgColor.copyConvertedToSRGB() {
            color = Color(cgColor)
        }
        
        let newClass = ClassModel(
            id: .init(),
            schoolModel: schoolModel,
            activitiesModel: [],
            teachersModel: [],
            name: name,
            timePerWeek: timePerWeek,
            colorHex: color.toHex()!
        )
        
        schoolModel.classModel.append(newClass)
        
        do {
            try modelContext.save()
        } catch {
            print("Error al guardar: \(error.localizedDescription)")
        }
        
        isPresented = false
    }
}

#Preview {
    do {
        let previewContainer = try ModelContainer(for: SchoolModel.self, ClassModel.self)

        previewContainer.mainContext.insert(Preview.schoolModel)
        previewContainer.mainContext.insert(Preview.classModel1)
        previewContainer.mainContext.insert(Preview.classModel2)

        return ClassAddView(isPresented: .constant(true))
            .modelContainer(previewContainer)
            .environment(Preview.schoolModel)
    } catch {
        return Text("Error: \(error)")
    }
}
