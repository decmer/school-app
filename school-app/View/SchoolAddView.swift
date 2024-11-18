//
//  SchoolAddView.swift
//  school-app
//
//  Created by Jose Merino Decena on 17/11/24.
//

import SwiftUI
import SwiftData

struct SchoolAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var school: [SchoolModel]
    
    @State private var name: String = ""
    @State private var img: Data?
    @State private var color: Color = .white
    @State private var isFileImporterPresented = false
    
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
                        VStack {
                            HStack {
                                Spacer()
                                Button("Select photo") {
                                    isFileImporterPresented.toggle()
                                }
                                .buttonStyle(.bordered)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                if let img, let img = UIImage(data: img){
                                    Image(uiImage: img)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width*0.8, height: geometry.size.width*0.8)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                } else {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: geometry.size.width*0.8, height: geometry.size.width*0.8)
                                        .foregroundStyle(.red)
                                }
                                Spacer()
                            }
                        }
                    }
                }
                
            }
            .toolbar(content: {
                Button("Create") {
                    let schoolAux = SchoolModel(id: UUID(), name: name, img: img, colorHex: color.toHex()!)
                    modelContext.insert(schoolAux)
                }
            })
            .fileImporter(
                isPresented: $isFileImporterPresented,
                allowedContentTypes: [UTType.image],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let urls):
                    if let selectedFileURL = urls.first, let imageData = try? Data(contentsOf: selectedFileURL) {
                        img = imageData
                    }
                case .failure(let error):
                    print("Error al seleccionar archivo: \(error.localizedDescription)")
                }
            }
        }
    }
}

import SwiftUI
import UniformTypeIdentifiers

#Preview {
    SchoolAddView()
        .modelContainer(for: SchoolModel.self, inMemory: true)
}
