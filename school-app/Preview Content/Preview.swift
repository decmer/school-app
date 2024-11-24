//
//  Preview.swift
//  school-app
//
//  Created by Jose Merino Decena on 22/11/24.
//

import Foundation
import SwiftUI
import SwiftData

class Preview {

    static let schoolModel = SchoolModel(id: .init(), classModel: [], usersModel: [], teachersModel: [], name: "Instituto Tecnológico Pablo de la Torre", colorHex: Color.red.toHex()!)
    static let classModel1 = ClassModel(id: .init(), schoolModel: schoolModel, activitiesModel: [], teachersModel: [], name: "Mates", timePerWeek: 2, colorHex: Color.green.toHex()!)
    static let classModel2 = ClassModel(id: .init(), schoolModel: schoolModel, activitiesModel: [], teachersModel: [], name: "Fisica", timePerWeek: 3, colorHex: Color.blue.toHex()!)
    
    static let activityModel1 = ActivitiesModels(id: .init(), classModel: classModel1, title: "Ejercicios de operadores lógicos", aDescription: "cual es la diferencia en java entre && y &, || y |.", dateInit: Date(), dateEnd: Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date())
}
