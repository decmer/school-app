//
//  CalendarView.swift
//  school-app
//
//  Created by Jose Merino Decena on 22/11/24.
//

import SwiftUI


struct CalendarView: View {
    @State private var currentDate = Date()
    @State private var selectedDate = Date()
    @State private var dragOffset = CGSize.zero  // Cambiado de @GestureState a @State

    private var calendar: Calendar { Calendar.current }

    // Obtener el primer día del mes
    private func getFirstDayOfMonth() -> Date {
        return calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate)) ?? Date()
    }

    // Obtener la cantidad de días en el mes
    private func getDaysInMonth() -> [Int] {
        let range = calendar.range(of: .day, in: .month, for: getFirstDayOfMonth())!
        return Array(range)
    }

    // Obtener el primer día de la semana del mes
    private func getFirstWeekday() -> Int {
        return calendar.component(.weekday, from: getFirstDayOfMonth())
    }

    // Obtener una fecha a partir de un número de día
    private func getDateFor(day: Int) -> Date {
        let components = DateComponents(year: calendar.component(.year, from: currentDate),
                                        month: calendar.component(.month, from: currentDate),
                                        day: day)
        return calendar.date(from: components) ?? Date()
    }

    var body: some View {
        VStack {
            // Título con el mes y el año
            Text("\(calendar.monthSymbols[calendar.component(.month, from: currentDate) - 1]) \(calendar.component(.year, from: currentDate))")
                .font(.title)
                .padding()

            // Calendario
            ScrollView(.vertical) {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    // Días de la semana
                    ForEach(1..<8) { day in
                        Text(self.calendar.weekdaySymbols[day - 1])
                            .fontWeight(.bold)
                            .padding()
                    }

                    // Obtener los días del mes y llenar los cuadros
                    let days = getDaysInMonth()
                    let firstWeekday = getFirstWeekday()

                    // Vacíos al principio del mes (para alinear con el primer día de la semana)
                    ForEach(0..<firstWeekday - 1, id: \.self) { _ in
                        Text("")
                            .frame(width: 40, height: 40)
                    }

                    // Los días del mes
                    ForEach(days, id: \.self) { day in
                        Button(action: {
                            self.selectedDate = getDateFor(day: day)
                        }) {
                            Text("\(day)")
                                .frame(width: 40, height: 40)
                                .background(self.selectedDate == getDateFor(day: day) ? Color.blue : Color.clear)
                                .cornerRadius(5)
                                .foregroundColor(self.selectedDate == getDateFor(day: day) ? .white : .black)
                        }
                        .padding(2)
                    }
                }
                .padding(.horizontal)
            }
            .gesture(DragGesture()
                .onChanged { value in
                    dragOffset = value.translation
                }
                .onEnded { value in
                    if dragOffset.height < -100 { // Deslizar hacia arriba
                        self.currentDate = calendar.date(byAdding: .month, value: 1, to: currentDate) ?? currentDate
                    } else if dragOffset.height > 100 { // Deslizar hacia abajo
                        self.currentDate = calendar.date(byAdding: .month, value: -1, to: currentDate) ?? currentDate
                    }
                    dragOffset = .zero
                })
        }
        .padding()
    }
}


#Preview {
    CalendarView()
}
