//
//  School.swift
//  school-app
//
//  Created by Jose Merino Decena on 16/11/24.
//

import SwiftUI

struct SchoolPreview: View {
    @Environment(\.modelContext) private var modelContext
    
    var model: SchoolModel
    
    var body: some View {
        GeometryReader { GeometryProxy in
            if let image = model.img, let image = UIImage(data: image) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: GeometryProxy.size.width , height: 200)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .foregroundStyle(Color(hex: model.colorHex))
                    .overlay {
                        VStack {
                            HStack {
                                Spacer()
                                Menu {
                                    Button(action: removeItem) {
                                        Text("Delete")
                                    }
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(.black)
                                        .background {
                                            Circle()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(.white)
                                        }
                                        .padding(15)
                                }
                            }
                            Spacer()
                            
                            HStack {
                                Text(model.name)
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
            } else {
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: GeometryProxy.size.width , height: 200)
                    .foregroundStyle(Color(hex: model.colorHex))
                    .overlay {
                        VStack {
                            HStack {
                                Spacer()
                                Menu {
                                    Button(action: removeItem) {
                                        Text("Delete")
                                    }
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(.black)
                                        .background {
                                            Circle()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(.white)
                                        }
                                        .padding(15)
                                }
                            }
                            Spacer()
                            
                            HStack {
                                Text(model.name)
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
    
    func removeItem() {
        modelContext.delete(model)
    }
}

#Preview {
    let size:CGFloat = 160
    if let uiImage = UIImage(named: "Schoolimgh") {
        ScrollView {
            VStack {
                HStack {
                    SchoolPreview(model: SchoolModel(id: UUID(), name: "pepe", img: uiImage.pngData()!, colorHex: "FF5733"))
                    .padding(20)
                }
            }
        }
        
    } else {
        ScrollView {
            VStack {
                HStack {
                    SchoolPreview(model: SchoolModel(id: UUID(), name: "pepe", img: nil, colorHex: "FF5733"))
                    .padding(20)
                }
            }
        }
    }
}
