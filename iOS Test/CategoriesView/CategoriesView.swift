//
//  CategoriesView.swift
//  iOS Test
//
//  Created by Rashif on 19/02/24.
//

import SwiftUI

struct CategoriesView: View {
    let imageNames = ["electronics", "shoes", "dresses"]
    @Binding var currentCategoryIndex: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(imageNames.indices, id: \.self) { index in
                    Image(imageNames[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 150)
                        .cornerRadius(10)
                        .onTapGesture {
                            self.currentCategoryIndex = index
                        }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
