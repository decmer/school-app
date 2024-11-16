//
//  StudentView.swift
//  school-app
//
//  Created by Jose Merino Decena on 17/11/24.
//

import SwiftUI

struct StudentView: View {
    let items = Array(1...50)
    
    var body: some View {
        NavigationStack {
            LazyAdapList(preferredWidth: 300) {
                ForEach(items, id: \.self) { item in
                    Text("Item \(item)")
                        .frame(width: 300, height: 300)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        .foregroundColor(.white)
                }
            }
            .navigationTitle("Schools")
            .toolbar {
                Button("Add") {
                    
                }
            }
        }
    }
}

#Preview {
    StudentView()
}
