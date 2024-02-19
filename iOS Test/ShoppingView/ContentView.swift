//
//  ContentView.swift
//  iOS Test
//
//  Created by Rashif on 19/02/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var products: [Product] = [
                Product(name: "Fitness Tracker", imageName: "fitnesstracker"),
                Product(name: "Wireless Charger", imageName: "wirelesscharger"),
                Product(name: "Smartphone", imageName: "smartphone"),
                Product(name: "Laptop", imageName: "laptop"),
                Product(name: "Headphones", imageName: "headphones"),
                Product(name: "Backpack", imageName: "backpack"),
                Product(name: "Wristwatch", imageName: "wristwatch"),
                Product(name: "Sneakers", imageName: "sneakers"),
                Product(name: "Book", imageName: "book"),
                Product(name: "Desk Lamp", imageName: "desklamp"),
                Product(name: "Gaming Console", imageName: "gamingconsole"),
                Product(name: "Camera", imageName: "camera"),
                Product(name: "Bluetooth Speaker", imageName: "bluetoothspeaker"),
                Product(name: "Sunglasses", imageName: "sunglasses"),
                Product(name: "T-shirt", imageName: "tshirt"),
                Product(name: "Jeans", imageName: "jeans"),
                Product(name: "Water Bottle", imageName: "waterbottle"),
                Product(name: "Coffee Mug", imageName: "coffeemug"),
                Product(name: "Notebook", imageName: "notebook"),
                Product(name: "Tablet", imageName: "tablet")
            ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    CategoriesView()
                        .frame(height: 150)
                    
                    ProductsListView(searchText: searchText, products: products)
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Products")
        }
    }
}





#Preview {
    ContentView()
}
