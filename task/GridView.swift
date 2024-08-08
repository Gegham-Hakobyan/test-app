//
//  GridView.swift
//  task
//
//  Created by Gegham Hakobyan on 06.08.2024.
//

import SwiftUI

struct GridView: View {
    let products: [Product]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(products) { product in
                    GridProductCard(product: product)
                }
            }
            .padding()
        }
    }
}
struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(products: [Product.init(name: "jfds", price: 21, oldPrice: 23, rating: 1, reviews: 9, imageName: "product2", discount: 22, aboveText: "", aboveTextColour: "")])
    }
}
