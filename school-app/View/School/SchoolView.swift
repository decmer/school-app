//
//  SchoolView1.swift
//  school-app
//
//  Created by Jose Merino Decena on 20/11/24.
//

import SwiftUI
import SwiftData

struct SchoolView: View {
    
    struct NavigationItem: Hashable {
        var title: String
        var symbolName: String
        var destination: AnyView
        
        func hash(into hasher: inout Hasher) {
                hasher.combine(title)
                hasher.combine(symbolName)
            }

            static func == (lhs: NavigationItem, rhs: NavigationItem) -> Bool {
                lhs.title == rhs.title && lhs.symbolName == rhs.symbolName
            }
    }
    
    let institute: SchoolModel
    @State var titles: [NavigationItem] = [
        NavigationItem(title: "Class", symbolName: "graduationcap", destination: AnyView(ClassView())),
        NavigationItem(title: "Schedule", symbolName: "calendar", destination: AnyView(Text("Schedule"))),
        NavigationItem(title: "Release", symbolName: "arrow.up.circle", destination: AnyView(Text("Release"))),
        NavigationItem(title: "Fouls", symbolName: "exclamationmark.circle", destination: AnyView(Text("Fouls"))),
        NavigationItem(title: "Information", symbolName: "info.circle", destination: AnyView(Text("Information"))),
        NavigationItem(title: "Incidents", symbolName: "exclamationmark.triangle", destination: AnyView(Text("Incidents")))
    ]
    
    let color = Color.orange
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                HStack {
                    Spacer()
                    VStack(spacing: 30) {
                        Spacer()
                        LazyAdapList(preferredWidth: 150) {
                            ForEach($titles, id: \.self) { title in
                                item(title.title.wrappedValue, nameSimbol: title.symbolName.wrappedValue, view: title.destination.wrappedValue, width: geometry.size.width)
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
    
    func item(_ name: String, nameSimbol: String, view: some View, width: CGFloat)-> some View {
        NavigationLink {
            view
                .environment(institute)
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
    do {
        let previewContainer = try ModelContainer(for: SchoolModel.self, ClassModel.self)

        previewContainer.mainContext.insert(Preview.schoolModel)
        previewContainer.mainContext.insert(Preview.classModel1)
        previewContainer.mainContext.insert(Preview.classModel2)

        return SchoolView(institute: SchoolModel(id: .init(), classModel: [], name: "School Name", img: nil, colorHex: Color.green.toHex()!))
            .modelContainer(previewContainer)
            .environment(Preview.schoolModel)
    } catch {
        return Text("Error: \(error)")
    }
}
