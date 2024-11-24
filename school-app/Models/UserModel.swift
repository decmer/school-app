//
//  UserModel.swift
//  school-app
//
//  Created by Jose Merino Decena on 24/11/24.
//

import Foundation
import SwiftData

@Model
final class UserModel {
    var id: UUID
    @Relationship() var schoolModel: [SchoolModel]
    @Relationship() var teacherModel: [TeachersModels]
    var name: String
    var surname: String
    
    init(id: UUID, schoolModel: [SchoolModel], teacherModel: [TeachersModels], name: String, surname: String) {
        self.id = id
        self.schoolModel = schoolModel
        self.teacherModel = teacherModel
        self.name = name
        self.surname = surname
    }
}
