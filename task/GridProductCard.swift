//
//  GridProductCard.swift
//  task
//
//  Created by Gegham Hakobyan on 06.08.2024.
//

import SwiftUI

struct GridProductCard: View {
    let product: Product
    @State private var showSecondButton = false
    @State private var selectedUnit = 1
    @State private var quantity = 0.1
    private let pricePerUnit = 10.0 // will take from product in future
    @State private var price: Double
    @State private var isPressed: Bool = false

    init(product: Product) {
        self.product = product
        self._price = State(initialValue: Double(Int(product.price)))
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(product.aboveText)
                    .font(.caption)
                    .padding(6)
                    .background(Color(product.aboveTextColour))
                    .foregroundColor(.white)
                    .cornerRadius(4)
                    .padding(0)
                HStack{
                    Spacer()
                    VStack(spacing:0) {
                        Button(action: {
                            isPressed.toggle()
                        }) {
                            Image(systemName: isPressed ? "heart.fill" : "heart")
                                .padding()
                                .foregroundColor(isPressed ? Color.green : Color.gray)
                        }
                        
                        Button(action: {
                        }) {
                            Image("cardAction")
                                .padding()
                        }
                    }
                    .padding([.top, .trailing], 8)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(16)
                }
            }
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(product.rating, specifier: "%.1f")")
                    .font(.subheadline)
                Spacer()
            }
            .padding(.leading)
            
            Text(product.name)
                .font(.subheadline)
                .padding([.leading, .trailing])
            
            Spacer()
            
            if showSecondButton {
                VStack {
                    Picker(selection: $selectedUnit, label: Text("")) {
                        Text("ШТ").tag(0)
                        Text("Кг").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: selectedUnit) { newValue in
                        if newValue == 0 {
                            quantity = 1
                        } else {
                            quantity = 0.1
                        }
                        updatePrice()
                    }
                    HStack(spacing: 0) {
                        Button(action: {
                            if selectedUnit == 1 && quantity > 0.1 {
                                quantity -= 0.1
                                updatePrice()
                            } else if selectedUnit == 0 && quantity > 1 {
                                quantity -= 1
                                updatePrice()
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                                .frame(width: 30)
                        }
                        Spacer()
                        VStack(spacing: 2) {
                            Text(selectedUnit == 1 ? String(format: "%.1f Кг", quantity) : String(format: "%.0f ШТ", quantity))
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                            Text(String(format: "~%.2f ₽", price))
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        }
                        Spacer()
                        Button(action: {
                            if selectedUnit == 1 {
                                quantity += 0.1
                            } else {
                                quantity += 1
                            }
                            updatePrice()
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .frame(width: 30)
                        }
                    }
                    .frame(height: 36)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                }
                .padding([.bottom, .leading, .trailing],4)
            } else {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("\(product.price, specifier: "%.2f") ₽/кг")
                            .font(.system(size: 16))
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        Button(action: {
                            showSecondButton = true
                        }) {
                            Image("buy")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .frame(height: 40)
                                .cornerRadius(20)
                        }
                    }
                    if let oldPrice = product.oldPrice {
                        Text("\(oldPrice, specifier: "%.2f")")
                            .font(.subheadline)
                            .strikethrough()
                            .foregroundColor(.gray)
                    }
                }
                .padding([.leading, .trailing])
                
                Spacer()
            }
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 5)
    }
    
    func updatePrice() {
        if selectedUnit == 1 {
            price = quantity * product.price
        } else {
            price = quantity * pricePerUnit
        }
    }
    
}

struct GridProductCard_Previews: PreviewProvider {
    static var previews: some View {
        GridProductCard(product: Product.init(name: "jfds", price: 21, oldPrice: 23, rating: 2, reviews: 77, imageName: "product2", discount: 22, aboveText: "", aboveTextColour: ""))
    }
}
