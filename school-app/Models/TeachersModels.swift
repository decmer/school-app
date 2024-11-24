//
//  TeachersModels.swift
//  school-app
//
//  Created by Jose Merino Decena on 24/11/24.
//

import Foundation
import SwiftData

@Model
final class TeachersModels {
    var id: UUID
    @Relationship() var schoolModel: SchoolModel
    @Relationship() var classesModels: [ClassModel]
    @Relationship() var userModel: UserModel
    var name: String
    var surname: String
    
    init(id: UUID, schoolModel: SchoolModel, classesModels: [ClassModel], userModel: UserModel, name: String, surname: String) {
        self.id = id
        self.schoolModel = schoolModel
        self.classesModels = classesModels
        self.userModel = userModel
        self.name = name
        self.surname = surname
    }
}
