//
//  SchoolView1.swift
//  school-app
//
//  Created by Jose Merino Decena on 20/11/24.
//

import SwiftUI

struct SchoolView: View {
    let institute: SchoolModel
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                HStack {
                    Spacer()
                    VStack(spacing: 30) {
                        Spacer()
                        item("Class", width: geometry.size.width)
                        item("Schedule", width: geometry.size.width)
                        item("Release", width: geometry.size.width)
                        item("Fouls", width: geometry.size.width)
                        item("Information", width: geometry.size.width)
                        item("Incidents", width: geometry.size.width)
                        item("Secretariat", width: geometry.size.width)
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
    SchoolView(institute: SchoolModel(id: .init(), name: "School Name", img: nil, colorHex: "#000000"))
}
