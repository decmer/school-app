//
//  SchoolView1.swift
//  school-app
//
//  Created by Jose Merino Decena on 20/11/24.
//

import SwiftUI

struct SchoolView: View {
    let institute: SchoolModel
    private let titles = [
        ["Class", "graduationcap"],
        ["Schedule", "calendar"],
        ["Release", "arrow.up.circle"],
        ["Fouls", "exclamationmark.circle"],
        ["Information", "info.circle"],
        ["Incidents", "exclamationmark.triangle"]]
    
    let color = Color.orange
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                HStack {
                    Spacer()
                    VStack(spacing: 30) {
                        Spacer()
                        LazyAdapList(preferredWidth: 150) {
                            ForEach(titles, id: \.self) { title in
                                item(title[0],nameSimbol: title[1] , width: geometry.size.width)
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                    .navigationTitle(institute.name)
                }
            }
        }
    }
    
    func item(_ name: String, width: CGFloat)-> some View {
        NavigationLink {
            Text("Secretariat 1")
        } label: {
            ZStack {
                Text(name)
                    .padding(7)
                    .foregroundStyle(.inverse)
                    .frame(width: width * 0.6)
                    .background(content: {
                        RoundedRectangle(cornerRadius: 7)
                            
                            .foregroundStyle(Color.tPrimary)
                    })
            }
        }
    }
}

#Preview {
    SchoolView(institute: SchoolModel(id: .init(), classModel: [], name: "School Name", img: nil, colorHex: "#000000"))
}
