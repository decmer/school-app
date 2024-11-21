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
    
    func item(_ name: String, nameSimbol: String, width: CGFloat)-> some View {
        NavigationLink {
            Text("Secretariat 1")
                
        } label: {
            itemview(name, nameSimbol: nameSimbol, width: width)
        }
    }
    
    func itemview(_ name: String, nameSimbol: String, width: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 7)
            .frame(width: 150, height: 100)
            .foregroundStyle(LinearGradient.harmoniousGradient(baseColor: Color(hex: institute.colorHex)))
            .overlay {
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: nameSimbol)
                            .foregroundStyle(Color(hex: institute.colorHex).contrastingColor())
                        Text(name)
                            .font(.headline)
                            .foregroundStyle(Color(hex: institute.colorHex).contrastingColor())
                    }
                    Spacer()                }
            }
        
    }
}

#Preview {
    SchoolView(institute: SchoolModel(id: .init(), classModel: [], name: "School Name", img: nil, colorHex: Color.green.toHex()!))
}
