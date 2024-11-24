//
//  SchoolAddView.swift
//  school-app
//
//  Created by Jose Merino Decena on 17/11/24.
//

import SwiftUI
import SwiftData
import PhotosUI
import UniformTypeIdentifiers

struct SchoolAddView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var name: String = ""
    @State private var img: Data?
    @State private var color: Color = .white
    @State private var isFileImporterPresented = false
    @State private var selectedItem: PhotosPickerItem? = nil

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
                    

                    Section {
                        PhotosPicker(
                                    selection: $selectedItem,
                                    matching: .images,
                                    photoLibrary: .shared()) {
                                        Text("Selecciona una foto")
                                    }
                                    .onChange(of: selectedItem) { newItem, _ in
                                        Task {
                                            if let selectedItem, let data = try? await selectedItem.loadTransferable(type: Data.self) {
                                                img = data
                                            }
                                        }
                                    }
                                if let img, let uiImage = UIImage(data: img) {
                                    HStack {
                                        Spacer()
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 200, height: 200)
                                        Spacer()
                                    }
                                }
                    }
                }
                
            }
            .toolbar(content: {
                Button("Create") {
                    if let cgColor = UIColor(color).cgColor.copyConvertedToSRGB() {
                        color = Color(cgColor)
                    }
                    let schoolAux = SchoolModel(id: UUID(), classModel: [], usersModel: [], teachersModel: [], name: name, img: img, colorHex: color.toHex()!)
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

        return SchoolAddView(isPresented: Bool.$trueState)
            .modelContainer(previewContainer)
            .environment(Preview.schoolModel)
    } catch {
        return Text("Error: \(error)")
    }
}
