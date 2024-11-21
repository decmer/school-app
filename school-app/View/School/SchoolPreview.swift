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
        RoundedRectangle(cornerRadius: 7)
            .foregroundStyle(Color(hex: model.colorHex))
            .overlay {
                VStack {
                    if let image = model.img, let image = UIImage(data: image) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxHeight: 155)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
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
                                }
                            }
                            
                    } else {
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
                    }
                    Spacer()
                    HStack {
                        Text(model.name)
                            .foregroundStyle(Color(hex: model.colorHex).contrastingColor())
                            .padding([.bottom, .horizontal], 15)
                        Spacer()
                    }
                }
            }
    }
    
    func removeItem() {
        modelContext.delete(model)
    }
    //            if let image = model.img, let image = UIImage(data: image) {

}

#Preview {
    let size:CGFloat = 160
    if let uiImage = UIImage(named: "Schoolimg") {
        ScrollView {
            VStack {
                    SchoolPreview(model: SchoolModel(id: UUID(), classModel: [], name: "peh jdshbgfj dgfhdjsg hjsdfg hjsdfgh sdfghsdjfg sdhfg hjpe", img: uiImage.pngData()!, colorHex: "FF5733"))
                    .frame(width: 350, height: 200)
                SchoolPreview(model: SchoolModel(id: UUID(), classModel: [], name: "peh jdshbgfj dgfhdjsg hjsdfg hjsdfgh sdfghsdjfg sdhfg hjpe", img: uiImage.pngData()!, colorHex: "FF5733"))
                    .frame(width: 300, height: 200)
            }
        }
        
    } else {
        ScrollView {
            VStack {
                HStack {
                    SchoolPreview(model: SchoolModel(id: UUID(), classModel: [], name: "pepe", img: nil, colorHex: "FF5733"))
                    .padding(20)
                }
            }
        }
    }
}
