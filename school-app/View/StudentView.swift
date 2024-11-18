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
    @Query private var school: [SchoolModel]
    
    @State var isAdd = false
    
    var searchSchool: [SchoolModel] {
        return school
    }
    
    var body: some View {
        NavigationStack {
            LazyAdapList(preferredWidth: 200) {
                ForEach(searchSchool, id: \.self) { item in
                    if let img = item.img {
                        SchoolView(color: Color(hex: item.colorHex), image: Image(uiImage: (UIImage(data: img) ?? UIImage(named: "Schoolimg"))!)) {
                            print("hola")
                        }
                        .frame(width: 300, height: 300)
                    } else {
                        SchoolView(color: Color(hex: item.colorHex), image: nil) {
                            print("hola")
                        }
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
