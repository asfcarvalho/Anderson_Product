//
//  ProductDetailViewView.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 05/09/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Common
import BaseUI
//import Components
import DataModules

struct ProductDetailView: View {
    
    @ObservedObject var input: ProductDetailViewModel
    public var output = MyObservableObject<ViewModel.ProductDetail.ViewOutput.Action>()
    
    private var token = CancelBag()
    
    init(input: ProductDetailViewModel) {
        self.input = input
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    if let product = input.product {
                        VStack(alignment: .leading, spacing: 16) {
                            AsyncImage(url: URL(string: product.thumbnail)) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }.frame(maxWidth: 300, idealHeight: 150)

                            Image(systemName: product.icon)
                                .foregroundColor(Color.yellow)
                            
                            Text(product.title)
                            Text(product.ratingString)
                            Text(product.priceString)
                            Text(product.discount)
                            Text(product.stockString)
                        }.padding()
                    }
                }
            }.navigationBarHidden(true)                
        }
    }
}

//
// MARK: - Previews
//
#if canImport(SwiftUI) && DEBUG
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let products: Products? = LoadJsonData.loadJson(filename: "ProductList")
        let product = products?.products?.first?.asProduct()
        ProductDetailView(input: .init(product))
    }
}
#endif
