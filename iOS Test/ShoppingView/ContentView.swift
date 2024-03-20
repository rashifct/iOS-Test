//
//  ContentView.swift
//  iOS Test
//
//  Created by Rashif on 19/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var currentCategoryIndex = 0
    let imageNames = ["electronics", "shoes", "dresses"]
    
    var displayedProducts: [Product] {
        let startIndex = currentCategoryIndex * 8
        let endIndex = min(startIndex + 8, products.count)
        return Array(products[startIndex..<endIndex])
    }
    
    var products: [Product] = [
        Product(name: "Smart Fitness Tracker", imageName: "fitnesstracker"),
        Product(name: "Fast Wireless Charger", imageName: "wirelesscharger"),
        Product(name: "Advanced Smartphone", imageName: "smartphone"),
        Product(name: "Ultra HD Laptop", imageName: "laptop"),
        Product(name: "Noise-Cancelling Headphones", imageName: "headphones"),
        Product(name: "Portable SSD", imageName: "portablessd"),
        Product(name: "E-Reader", imageName: "ereader"),
        Product(name: "Smart Home Hub", imageName: "smarthomehub"),
        Product(name: "Running Sneakers", imageName: "sneakers"),
        Product(name: "Outdoor Sandals", imageName: "sandals"),
        Product(name: "Hiking Shoes", imageName: "hikingshoes"),
        Product(name: "Sport Sandals", imageName: "sportsandals"),
        Product(name: "Waterproof Boots", imageName: "waterproofboots"),
        Product(name: "Trail Running Shoes", imageName: "trailrunningshoes"),
        Product(name: "Casual Loafers", imageName: "casualloafers"),
        Product(name: "Formal Dress Shoes", imageName: "formaldressshoes"),
        Product(name: "Casual T-shirt", imageName: "tshirt"),
        Product(name: "Formal Shirt", imageName: "formalshirt"),
        Product(name: "Summer Dress", imageName: "summerdress"),
        Product(name: "Jeans", imageName: "jeans"),
        Product(name: "Leather Jacket", imageName: "leatherjacket"),
        Product(name: "Silk Scarf", imageName: "silkscarf"),
        Product(name: "Polo Shirt", imageName: "poloshirt"),
        Product(name: "Chino Pants", imageName: "chinopants"),
        Product(name: "Backpack", imageName: "backpack"),
        Product(name: "Wristwatch", imageName: "wristwatch"),
        Product(name: "Water Bottle", imageName: "waterbottle"),
        Product(name: "Coffee Mug", imageName: "coffeemug"),
        Product(name: "Notebook", imageName: "notebook"),
        Product(name: "Tablet", imageName: "tablet"),
        Product(name: "Desk Organizer", imageName: "deskorganizer"),
        Product(name: "Wireless Mouse", imageName: "wirelessmouse")
    ]
    
    var body: some View {
        VStack {
            HorizontalCollectionView(currentCategoryIndex: $currentCategoryIndex, imageNames: imageNames)
                .frame(height: 150)
                .padding(.top, 30)
            
            NavigationView {
                VStack {
                    ScrollView {
                        ProductsListView(searchText: searchText, products: displayedProducts)
                    }
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .navigationTitle("Products")
            }
        }
    }
}


#Preview {
    ContentView()
}
