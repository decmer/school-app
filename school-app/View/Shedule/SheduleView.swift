//
//  SheduleView.swift
//  school-app
//
//  Created by Jose Merino Decena on 24/11/24.
//

import SwiftUI

struct ScheduleView: View {
    @State var schedules: [ScheduleModel] = []
    let schoolModel: SchoolModel

    var body: some View {
        NavigationView {
            List {
                ForEach(groupedSchedules(), id: \.key) { day, dailySchedules in
                    Section(header: Text(day).font(.headline)) {
                        ForEach(dailySchedules, id: \.id) { schedule in
                            VStack(alignment: .leading) {
                                Text(schedule.classModel.name)
                                    .font(.title3)
                                    .bold()
                                Text("Professor: \(schedule.teacher.name) \(schedule.teacher.surname)")
                                    .font(.subheadline)
                                Text("\(schedule.startTime) - \(schedule.endTime)")
                                    .font(.footnote)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Schedules")
            .onAppear {
                schedules = generateSchedules(for: schoolModel)
            }
        }
    }
    
    /// Agrupa los horarios por día
    private func groupedSchedules() -> [(key: String, value: [ScheduleModel])] {
        let grouped = Dictionary(grouping: schedules) { $0.day }
        return grouped.sorted(by: { $0.key < $1.key })
    }
    
    /// Genera horarios para la escuela (implementación del algoritmo anterior)
    private func generateSchedules(for school: SchoolModel) -> [ScheduleModel] {
        var schedules: [ScheduleModel] = []
        let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
        var timeSlotIndex = 0
        
        for classModel in school.classModel {
            let totalHours = classModel.timePerWeek
            let hoursPerDay = totalHours / daysOfWeek.count
            let remainingHours = totalHours % daysOfWeek.count
            
            guard let mainTeacher = classModel.teachersModel.first else { continue }
            
            for (index, day) in daysOfWeek.enumerated() {
                let hoursForToday = hoursPerDay + (index < remainingHours ? 1 : 0)
                if hoursForToday == 0 { continue }
                
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

#Preview {
    ScheduleView(schoolModel: Preview.schoolModel)
}
