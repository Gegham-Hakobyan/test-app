//
//  ListProductCard.swift
//  task
//
//  Created by Gegham Hakobyan on 06.08.2024.
//

import SwiftUI

struct ListProductCard: View {
    let product: Product
    @State private var showSecondButton = false
    @State private var selectedUnit = false
    @State private var quantity = 0.1
    private let pricePerUnit = 10.0 // will take from product in future
    @State private var price: Double
    @State private var isPressed: Bool = false
    
    init(product: Product) {
        self.product = product
        self._price = State(initialValue: Double(Int(product.price)))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
            
            ZStack(alignment: .topLeading) {
                HStack(spacing: 10) {
                    Image(product.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 144)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(product.rating, specifier: "%.1f") | \(product.reviews) отзывов")
                                .font(.subheadline)
                            Spacer()
                        }
                        
                        Text(product.name)
                            .font(.caption)
                            .padding(.trailing, 36)
                        
                        if showSecondButton {
                            VStack {
                                Picker(selection: $selectedUnit, label: Text("")) {
                                    Text("ШТ").tag(true)
                                    Text("Кг").tag(false)
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .onChange(of: selectedUnit) { newValue in
                                    if newValue  {
                                        quantity = 1
                                    } else {
                                        quantity = 0.1
                                    }
                                    updatePrice()
                                }
                                HStack(spacing: 0) {
                                    Button(action: {
                                        if !selectedUnit && quantity > 0.1 {
                                            quantity -= 0.1
                                            updatePrice()
                                        } else if selectedUnit && quantity > 1 {
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
                                        Text(!selectedUnit ? String(format: "%.1f Кг", quantity) : String(format: "%.0f ШТ", quantity))
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                        Text(String(format: "~%.2f ₽", price))
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                    }
                                    Spacer()
                                    Button(action: {
                                        if !selectedUnit {
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
                            .padding([.bottom, .leading, .trailing], 4)
                        } else {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text("\(product.price, specifier: "%.2f") ₽/кг")
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                    
                                    
                                    Spacer()
                                    Button(action: {
                                        showSecondButton = true
                                    }) {
                                        Image("buy")
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color.green)
                                            .cornerRadius(20)
                                        Spacer().frame(width: 6)
                                        
                                    }
                                }
                                if let oldPrice = product.oldPrice {
                                    Text("\(oldPrice, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .strikethrough()
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .padding(0)
                .frame(height: 176)
                .background(Color.white)
                
                if !product.aboveText.isEmpty {
                    
                    Text(product.aboveText)
                        .font(.caption)
                        .padding(6)
                        .background(Color(product.aboveTextColour))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .padding(0)
                }
                VStack {
                    
                    HStack {
                        Spacer()
                        VStack(spacing: 0) {
                            Button(action: {
                                isPressed.toggle()

                            }) {
                                Image(systemName: isPressed ? "heart.fill" : "heart")
                                    .padding(8)
                                    .background(Color.white.opacity(0.5))
                                    .cornerRadius(8)
                                    .foregroundColor(isPressed ? Color.green : Color.gray)

                            }
                            
                            Button(action: {

                            }) {
                                Image("cardAction")
                                    .padding(8)
                                    .background(Color.white.opacity(0.5))
                                    .cornerRadius(8)
                            }
                        }
                        .padding([.top, .trailing], 8)
                    }
                    Spacer()
                }
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
    
    func updatePrice() {
        if selectedUnit  {
            price = quantity * pricePerUnit
        } else {
            price = quantity * product.price
            
        }
    }
}

struct ListProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ListProductCard(product: Product(
            name: "productIm ageproductI mageproduc tImage",
            price: 1212,
            oldPrice: 2112,
            rating: 4.5, reviews: 7,
            imageName: "product4", discount: 22,
            aboveText: "фсдфс",
            aboveTextColour: "aboveTextGreen"
        ))
    }
}
