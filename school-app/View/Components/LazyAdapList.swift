//
//  LazyAdapList.swift
//  school-app
//
//  Created by Jose Merino Decena on 17/11/24.
//

import SwiftUI

struct LazyAdapList<Content> : View where Content : View {
    let items = Array(1...50)
    var preferredWidth: CGFloat
    var data: () -> Content
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                let columns = [GridItem(.adaptive(minimum: calculateColumnWidth(for: geometry.size.width)))]
                LazyVGrid(columns: columns, spacing: 10, content: data)
                .padding()
            }
        }
    }
    private func calculateColumnWidth(for screenWidth: CGFloat) -> CGFloat {
        if preferredWidth <= 50 { return 50 }
        let maxColumns = Int(screenWidth / preferredWidth)
        let actualWidth = screenWidth / CGFloat(maxColumns)
        return max(actualWidth, preferredWidth)
    }
}

#Preview {
    LazyAdapList(preferredWidth: 250) {
        ForEach(Range(1...50), id: \.self) { i in
            Text("Item\(i)")
                .frame(width: 100, height: 100)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 7))
        }
    }
}
