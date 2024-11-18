//
//  School.swift
//  school-app
//
//  Created by Jose Merino Decena on 16/11/24.
//

import SwiftUI

struct SchoolView: View {
    var color: Color
    var image: Image?
    var action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(color)
            .overlay {
                VStack {
                    HStack {
                        Text("School")
                        Spacer()
                        Image(systemName: "ellipsis")
                            .onTapGesture {
                                action()
                            }
                    }
                    Spacer()
                    if let image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                    Spacer()
                    
                    
                }
                .padding()
            }
    }
}

#Preview {
    let size:CGFloat = 270
    if let uiImage = UIImage(named: "Schoolimg") {
        HStack {
            SchoolView(color: .blue, image: Image(uiImage: uiImage)) {
                print("hola")
            }
            .frame(width: size, height: size)
        }
        
    } else {
        SchoolView(color: .blue, image: nil) {
            
        }
            .frame(width: 200, height: 200)
    }
}
