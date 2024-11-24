//
//  ActivitiesModels.swift
//  school-app
//
//  Created by Jose Merino Decena on 24/11/24.
//

import Foundation
import SwiftData

@Model
final class ActivitiesModels {
    var id: UUID
    @Relationship()
    var classModel: ClassModel
    var title: String
    var aDescription: String
    var dateInit: Date
    var dateEnd: Date
    
    init(id: UUID, classModel: ClassModel, title: String, aDescription: String, dateInit: Date, dateEnd: Date) {
        self.id = id
        self.classModel = classModel
        self.title = title
        self.aDescription = aDescription
        self.dateInit = dateInit
        self.dateEnd = dateEnd
    }
}
