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
    
    func generateSchedules(for school: SchoolModel) -> [ScheduleModel] {
        var schedules: [ScheduleModel] = []
        let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
        var timeSlotIndex = 0
        
        for classModel in school.classModel {
            let totalHours = classModel.timePerWeek
            let hoursPerDay = totalHours / daysOfWeek.count
            let remainingHours = totalHours % daysOfWeek.count
            
            // Asignar al primer profesor de la lista
            guard let mainTeacher = classModel.teachersModel.first else { continue }
            
            for (index, day) in daysOfWeek.enumerated() {
                let hoursForToday = hoursPerDay + (index < remainingHours ? 1 : 0)
                if hoursForToday == 0 { continue }
                
                // Crear intervalos de tiempo (ejemplo: 9:00-10:00)
                for hour in 0..<hoursForToday {
                    let startTime = "\(9 + timeSlotIndex):00"
                    let endTime = "\(10 + timeSlotIndex):00"
                    timeSlotIndex += 1
                    
                    let schedule = ScheduleModel(
                        id: UUID(),
                        teacher: mainTeacher,
                        classModel: classModel,
                        day: day,
                        startTime: startTime,
                        endTime: endTime
                    )
                    schedules.append(schedule)
                }
            }
        }
        return schedules
    }
}
