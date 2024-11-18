//
//  ViewModel.swift
//  school-app
//
//  Created by Jose Merino Decena on 18/11/24.
//

import SwiftUI
import SwiftData

@Observable
class ViewModel {
    var listSchools: [SchoolModel] = []
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
        fetchSchools()
    }
    
    func fetchSchools() {
        let descriptor = FetchDescriptor<SchoolModel>()
        do {
            listSchools = try context.fetch(descriptor)
        } catch {
            print("Error")
        }
    }
}
