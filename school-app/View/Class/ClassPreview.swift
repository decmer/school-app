//
//  ClassView.swift
//  school-app
//
//  Created by Jose Merino Decena on 20/11/24.
//

import SwiftUI

struct ClassPreview: View {
    
    let classModel: ClassModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 7)
            
            .overlay {
                VStack {
                    HStack {
                        Text(classModel.name)
                            .foregroundStyle(.white)
                            .padding(7)
                        Spacer()
                        Image(systemName: "ellipsis")
                            .onTapGesture {
                                
                            }
                            .background {
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.white)
                            }
                            .padding(19)
                    }
                    RoundedRectangle(cornerRadius: 7)
                        .frame(width: .infinity, height: 1)
                        .foregroundStyle(.white)
                    Spacer()
                    RoundedRectangle(cornerRadius: 7)
                        .foregroundStyle(Color.white)
                        .overlay {
                            VStack {
                                Text("Tareas pendientes")
                                    .underline()
                                    .font(.footnote)
                                    .foregroundStyle(.black)
                                    .padding(7)
                                Spacer()
                                
                            }
                        }
                        .padding(3)
                }
            }
    }
}
