//
//  Color.swift
//  iOS Test
//
//  Created by Rashif on 19/02/24.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
