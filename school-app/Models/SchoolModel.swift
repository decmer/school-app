//
//  Item.swift
//  school-app
//
//  Created by Jose Merino Decena on 16/11/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class SchoolModel {
    var id: UUID
    var name: String
    var img: Data?
    var colorHex: String
    
    init(id: UUID, name: String, img: Data?, colorHex: String) {
        self.id = id
        self.name = name
        self.img = img
        self.colorHex = colorHex
    }
}
