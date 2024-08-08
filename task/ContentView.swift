//
//  ContentView.swift
//  task
//
//  Created by Gegham Hakobyan on 05.08.2024.

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isGridView {
                    GridView(products: viewModel.allProducts)
                } else {
                    ListView(products: viewModel.allProducts)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        viewModel.isGridView.toggle()
                    }) {
                        Image(viewModel.isGridView ? "gridIcon" : "listIcon")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding()
                            .background(Color.grayBackground)
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
