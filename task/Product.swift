//
//  Product.swift
//  task
//
//  Created by Gegham Hakobyan on 05.08.2024.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let oldPrice: Double?
    let rating: Double
    let reviews: Int
    let imageName: String
    let discount: Int
    let aboveText: String
    let aboveTextColour: String
}

