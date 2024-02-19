//
//  ProductsListView.swift
//  iOS Test
//
//  Created by Rashif on 19/02/24.
//

import SwiftUI

struct ProductsListView: View {
    let searchText: String
    var products: [Product]
    
    var filteredProducts: [Product] {
        searchText.isEmpty ? products : products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        ForEach(filteredProducts) { product in
            HStack {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .background(Color.random)
                    .clipShape(Circle())

                Text(product.name)
                    .padding(.leading, 20)
                Spacer()
                
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .padding(.leading, 15)
            .cornerRadius(10)
            
        }
    }
}
