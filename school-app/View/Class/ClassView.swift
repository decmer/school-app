//
//  ClassView.swift
//  school-app
//
//  Created by Jose Merino Decena on 24/11/24.
//

import SwiftUI
import SwiftData

struct ClassView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(ClassModel.self) private var classModel
    @Query var classModels: [ActivitiesModels]
    
    @State var option: Int = 0
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 15) {
                Button(action: {
                    option = 0
                }, label: {
                    Text("Class board")
                        .font(.system(size: 17, weight: .bold))
                })
                .foregroundStyle(.white)
                .padding(13)
                .background {
                    if option == 0 {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundStyle(.gray.opacity(0.8))
                    }
                }
                
                Button(action: {
                    option = 1
                }, label: {
                    Text("Activities")
                        .font(.system(size: 17, weight: .bold))
                })
                .foregroundStyle(.white)
                .padding(13)
                .background {
                    if option == 1 {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundStyle(.gray.opacity(0.8))
                    }
                }
                
                Button(action: {
                    option = 2
                }, label: {
                    Text("Classmates")
                        .font(.system(size: 17, weight: .bold))
                })
                .foregroundStyle(.white)
                .padding(13)
                .background {
                    if option == 2 {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundStyle(.gray.opacity(0.8))
                    }
                }
            }
            .padding(5)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.grayWhite)
            }
            .padding(.top, 15)
            
            Spacer()
                .navigationTitle(classModel.name)
        }
    }
}

#Preview {
    do {
        let previewContainer = try ModelContainer(for: SchoolModel.self, ClassModel.self, ActivitiesModels.self)

        previewContainer.mainContext.insert(Preview.schoolModel)
        previewContainer.mainContext.insert(Preview.classModel1)
        previewContainer.mainContext.insert(Preview.classModel2)

        return ClassView()
            .modelContainer(previewContainer)
            .environment(Preview.classModel1)
    } catch {
        return Text("Error: \(error)")
    }
}
