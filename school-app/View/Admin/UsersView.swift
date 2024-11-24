//
//  UsersView.swift
//  school-app
//
//  Created by Jose Merino Decena on 24/11/24.
//

import SwiftUI

struct UsersView: View {
    @Environment(SchoolModel.self) var schoolModel
    
    @State private var isAdd: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                // Sección de profesores
                if !schoolModel.teachersModel.isEmpty {
                    Section(header: Text("Teachers")) {
                        ForEach(schoolModel.teachersModel, id: \.id) { teacher in
                            VStack(alignment: .leading) {
                                Text("\(teacher.name) \(teacher.surname)")
                                    .font(.headline)
                                Text("Classes: \(teacher.classesModels.count)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                // Sección de otros usuarios
                let nonTeachers = schoolModel.usersModel.filter { user in
                    !schoolModel.teachersModel.contains { $0.userModel.id == user.id }
                }
                
                if !nonTeachers.isEmpty {
                    Section(header: Text("Users")) {
                        ForEach(nonTeachers, id: \.id) { user in
                            VStack(alignment: .leading) {
                                Text("\(user.name) \(user.surname)")
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
            .toolbar(content: {
                Button("Add Class") {
                    isAdd = true
                }
            })
            .sheet(isPresented: $isAdd, content: {
                AddUserView(isPresented: $isAdd)
            })
            .navigationTitle("Users & Teachers")
        }
    }
}

#Preview {
    UsersView()
        .environment(Preview.schoolModel)
}
