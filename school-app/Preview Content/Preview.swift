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

    static let schoolModel = SchoolModel(
        id: .init(),
        classModel: [],
        name: "Instituto Tecnológico Pablo de la Torre",
        colorHex: Color.red.toHex()!
    )
    static let classModel1 = ClassModel(id: .init(), schoolModel: schoolModel, name: "Mates", colorHex: Color.green.toHex()!)
    static let classModel2 = ClassModel(id: .init(), schoolModel: schoolModel, name: "Fisica", colorHex: Color.blue.toHex()!)

}
