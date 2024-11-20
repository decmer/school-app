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
        if let image {
            image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .foregroundStyle(color)
                .overlay {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "ellipsis")
                                .onTapGesture {
                                    action()
                                }
                                .background {
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(.white)
                                }
                                .padding(15)
                        }
                        Spacer()
                        
                        HStack {
                            Text("12345678901234567890123456789")
                                .padding(4)
                                .foregroundStyle(.black)
                                .background(content: {
                                    RoundedRectangle(cornerRadius: 7)
                                        .foregroundStyle(.white)
                                })
                                .padding(4)
                            Spacer()
                        }
                    }
                }
        }
    }
}

#Preview {
    let size:CGFloat = 160
    if let uiImage = UIImage(named: "Schoolimg") {
        ScrollView {
            VStack {
                HStack {
                    SchoolView(color: .blue, image: Image(uiImage: uiImage)) {
                        print("hola")
                    }
                    .padding(40)
                    //.frame(width: size*2, height: size)
                }
            }
        }
        
    } else {
        SchoolView(color: .blue, image: nil) {
            
        }
            .frame(width: 200, height: 200)
    }
}
