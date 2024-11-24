//
//  AddUsersView.swift
//  school-app
//
//  Created by Jose Merino Decena on 24/11/24.
//

import SwiftUI

struct AddUserView: View {
    @Environment(SchoolModel.self) var schoolModel
    @Binding var isPresented: Bool
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var selectedClasses: Set<ClassModel> = []
    
    var body: some View {
        NavigationView {
            Form {
                // Sección de detalles del usuario
                Section(header: Text("User Details")) {
                    TextField("First Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Last Name", text: $surname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Sección de selección de clases
                Section(header: Text("Assign Classes")) {
                    if schoolModel.classModel.isEmpty {
                        Text("No classes available.")
                            .foregroundColor(.secondary)
                    } else {
                        List(schoolModel.classModel, id: \.id, selection: $selectedClasses) { classModel in
                            HStack {
                                Text(classModel.name)
                                Spacer()
                                if selectedClasses.contains(classModel) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                toggleClassSelection(classModel)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Add User")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        addUser()
                    }
                    .disabled(name.isEmpty || surname.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
        }
    }
    
    // Alterna la selección de una clase
    private func toggleClassSelection(_ classModel: ClassModel) {
        if selectedClasses.contains(classModel) {
            selectedClasses.remove(classModel)
        } else {
            selectedClasses.insert(classModel)
        }
    }
    
    // Añade el usuario como profesor si hay clases seleccionadas
    private func addUser() {
        let newUser = UserModel(
            id: UUID(),
            schoolModel: [schoolModel],
            teacherModel: [],
            name: name,
            surname: surname
        )
        
        schoolModel.usersModel.append(newUser)
        
        if !selectedClasses.isEmpty {
            let newTeacher = TeachersModels(
                id: UUID(),
                schoolModel: schoolModel,
                classesModels: Array(selectedClasses),
                userModel: newUser,
                name: name,
                surname: surname
            )
            selectedClasses.forEach { classModelIterator in
                classModelIterator.teachersModel.append(newTeacher)
            }
            schoolModel.teachersModel.append(newTeacher)
        }
        
        isPresented = false
    }
}

#Preview {
    AddUserView(isPresented: .constant(true))
        .environment(Preview.schoolModel)
}
