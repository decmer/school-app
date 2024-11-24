//
//  Item.swift
//  school-app
//
//  Created by Jose Merino Decena on 16/11/24.
//

import Foundation
import SwiftData

@Model
final class SchoolModel {
    var id: UUID
    @Relationship() var classModel: [ClassModel]
    @Relationship() var usersModel: [UserModel]
    @Relationship() var teachersModel: [TeachersModels]
    var name: String
    var img: Data?
    var colorHex: String
    
    init(id: UUID, classModel: [ClassModel], usersModel: [UserModel], teachersModel: [TeachersModels], name: String, img: Data? = nil, colorHex: String) {
        self.id = id
        self.classModel = classModel
        self.usersModel = usersModel
        self.teachersModel = teachersModel
        self.name = name
        self.img = img
        self.colorHex = colorHex
    }
}
