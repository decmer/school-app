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
    @State private var selectedSchool: SchoolModel?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Details")) {
                    TextField("First Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Last Name", text: $surname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Section(header: Text("School Assignment")) {
                    if let school = selectedSchool {
                        Text("Selected School: \(school.name)")
                            .foregroundColor(.secondary)
                    } else {
                        Text("Current School: \(schoolModel.name)")
                            .foregroundColor(.secondary)
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
    
    private func addUser() {
        let newUser = UserModel(
            id: UUID(),
            schoolModel: [schoolModel],
            teacherModel: [],
            name: name,
            surname: surname
        )
        
        schoolModel.usersModel.append(newUser)
        isPresented = false
    }
}
#Preview {
    AddUserView(isPresented: Bool.$trueState)
        .environment(Preview.schoolModel)
}
