//
//  ClassModel.swift
//  school-app
//
//  Created by Jose Merino Decena on 20/11/24.
//

import Foundation
import SwiftData

@Model
final class ClassModel {
    var id: UUID
    @Relationship() var schoolModel: SchoolModel
    @Relationship() var activitiesModel: [ActivitiesModels]
    @Relationship() var teachersModel: [TeachersModels]
    var name: String
    var timePerWeek: Int
    var colorHex: String
    
    init(id: UUID, schoolModel: SchoolModel, activitiesModel: [ActivitiesModels], teachersModel: [TeachersModels], name: String, timePerWeek: Int, colorHex: String) {
        self.id = id
        self.schoolModel = schoolModel
        self.activitiesModel = activitiesModel
        self.teachersModel = teachersModel
        self.name = name
        self.timePerWeek = timePerWeek
        self.colorHex = colorHex
    }
}
