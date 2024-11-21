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
    @Relationship()
    var schoolModel: SchoolModel
    var name: String
    var colorHex: String
    
    init(id: UUID, schoolModel: SchoolModel, name: String, colorHex: String) {
        self.id = id
        self.schoolModel = schoolModel
        self.name = name
        self.colorHex = colorHex
    }
}
