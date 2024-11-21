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
    @Relationship()
    var classModel: [ClassModel]
    var name: String
    var img: Data?
    var colorHex: String
    
    init(id: UUID, classModel: [ClassModel], name: String, img: Data? = nil, colorHex: String) {
        self.id = id
        self.classModel = classModel
        self.name = name
        self.img = img
        self.colorHex = colorHex
    }
}
