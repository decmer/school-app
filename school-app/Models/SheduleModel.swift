//
//  SheduleModel.swift
//  school-app
//
//  Created by Jose Merino Decena on 24/11/24.
//

import Foundation
import SwiftData

@Model
final class ScheduleModel {
    var id: UUID
    @Relationship() var teacher: TeachersModels
    @Relationship() var classModel: ClassModel
    var day: String
    var startTime: String
    var endTime: String
    
    init(id: UUID, teacher: TeachersModels, classModel: ClassModel, day: String, startTime: String, endTime: String) {
        self.id = id
        self.teacher = teacher
        self.classModel = classModel
        self.day = day
        self.startTime = startTime
        self.endTime = endTime
    }
}
