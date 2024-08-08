//
//  ProductViewModel.swift
//  task
//
//  Created by Gegham Hakobyan on 05.08.2024.
//

import Combine

class ProductViewModel: ObservableObject {
    @Published var allProducts: [Product] = [
        Product(name: "сыр Ламбер 500/0 230г", price: 211, oldPrice: 112, rating: 5, reviews: 34, imageName: "product6", discount: 25, aboveText: "Удар по ценам", aboveTextColour: "aboveTextRed"),
        Product(name: "Энергетический Напит", price: 1221, oldPrice: 2112, rating: 2.1, reviews: 9, imageName: "product2", discount: 25, aboveText: "Цена по карте", aboveTextColour: "aboveTextGreen"),
        Product(name: "Ролл Маленькая Япония 216г", price: 99.34, oldPrice: 300, rating: 4.1, reviews: 7, imageName: "product3", discount: 25,  aboveText: "Новинки", aboveTextColour: "aboveTextBlue"),
        Product(name: "Ролл Маленькая Япония 216г", price: 100.34, oldPrice: 200, rating: 1.1, reviews: 7, imageName: "product9", discount: 25, aboveText: "", aboveTextColour: ""),
        Product(name: "сыр Ламбер 500/0 230г", price: 99.34, oldPrice: 222, rating: 3.7, reviews: 5, imageName: "product6", discount: 25, aboveText: "Удар по ценам", aboveTextColour: "aboveTextRed"),
        Product(name: "Энергетический Напит", price: 99.34, oldPrice: 543, rating: 2.1, reviews: 6, imageName: "product2", discount: 25, aboveText: "Цена по карте", aboveTextColour: "aboveTextGreen"),
        Product(name: "Ролл Маленькая Япония 216г", price: 99.34, oldPrice: 199, rating: 4.1, reviews: 66, imageName: "product3", discount: 25,  aboveText: "Новинки", aboveTextColour: "aboveTextBlue"),
        Product(name: "Ролл Маленькая Япония 216г", price: 100.34, oldPrice: 300, rating: 1.1, reviews: 66, imageName: "product1", discount: 25, aboveText: "", aboveTextColour: ""),
        Product(name: "сыр Ламбер 500/0 230г", price: 99.34, oldPrice: 199, rating: 3.7, reviews: 55, imageName: "product9", discount: 25, aboveText: "Удар по ценам", aboveTextColour: "aboveTextRed"),
        Product(name: "Энергетический Напит", price: 99.34, oldPrice: 199, rating: 2.1, reviews: 77, imageName: "product12", discount: 25, aboveText: "Цена по карте", aboveTextColour: "aboveTextGreen"),
        Product(name: "Ролл Маленькая Япония 216г", price: 99.34, oldPrice: 199, rating: 4.1, reviews: 87, imageName: "product11", discount: 25,  aboveText: "Новинки", aboveTextColour: "aboveTextBlue"),
        Product(name: "Ролл Маленькая Япония 216г", price: 100.34, oldPrice: 300, rating: 1.1, reviews: 6, imageName: "product12", discount: 25, aboveText: "", aboveTextColour: ""),
        Product(name: "Ролл Маленькая Япония 216г", price: 99.34, oldPrice: 199, rating: 4.1, reviews: 5, imageName: "product3", discount: 25,  aboveText: "Новинки", aboveTextColour: "aboveTextBlue"),
        Product(name: "Ролл Маленькая Япония 216г", price: 100.34, oldPrice: 300, rating: 1.2, reviews: 4, imageName: "product1", discount: 25, aboveText: "", aboveTextColour: ""),
        Product(name: "сыр Ламбер 500/0 230г", price: 99.34, oldPrice: 199, rating: 3.7, reviews: 4, imageName: "product9", discount: 25, aboveText: "Удар по ценам", aboveTextColour: "aboveTextRed"),
        Product(name: "Энергетический Напит", price: 99.34, oldPrice: 721, rating: 3.5, reviews: 3, imageName: "product7", discount: 25, aboveText: "Цена по карте", aboveTextColour: "aboveTextGreen"),
        Product(name: "Ролл Маленькая Япония 216г", price: 99.34, oldPrice: 86, rating: 4.2, reviews: 2, imageName: "product8", discount: 25,  aboveText: "Новинки", aboveTextColour: "aboveTextBlue")
    ]

    @Published var isGridView: Bool = true
}
