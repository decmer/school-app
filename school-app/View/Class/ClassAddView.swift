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
    @Environment private var schoolModel: SchoolModel
    
    @State private var name: String = ""
    @State private var color: Color = .white
    
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
                    let schoolAux = ClassModel(id: .init(), schoolModel: schoolModel, name: name, colorHex: color.toHex()!)
                    modelContext.insert(schoolAux)
                    do {
                        try modelContext.save()
                    } catch {
                        print("Error al guardar: \(error.localizedDescription)")
                    }
                    
                }
            })
        }
    }
}
