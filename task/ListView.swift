//
//  ListView.swift
//  task
//
//  Created by Gegham Hakobyan on 06.08.2024.
//

import SwiftUI

struct ListView: View {
    let products: [Product]
    
    var body: some View {
        ScrollView {
            ForEach(products, id: \.id) { product in
                ListProductCard(product: product)
            }
        }
        .padding(.top, 10)
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(products: [Product.init(name: "jfds", price: 21, oldPrice: 23, rating: 1, reviews: 9, imageName: "product2", discount: 22, aboveText: "", aboveTextColour: "")])
    }
}
