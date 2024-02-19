//
//  SearchBar.swift
//  iOS Test
//
//  Created by Rashif on 19/02/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        TextField("Search...", text: $text)
            .padding(7)
            .background(Color(.systemGray5))
            .cornerRadius(8)

    }
}
