//
//  CategoriesView.swift
//  iOS Test
//
//  Created by Rashif on 19/02/24.
//

import SwiftUI

struct CategoriesView: View {
    let imageNames = ["electronics", "shoes", "dresses"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 150)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
