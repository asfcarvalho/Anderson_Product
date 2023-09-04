//
//  ProductsViewView.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 04/09/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Common
import BaseUI
//import Components
import DataModules

struct ProductsView: View {
    
    @ObservedObject var input: ProductsViewModel
    public var output = MyObservableObject<ViewModel.Products.ViewOutput.Action>()
    
    private var token = CancelBag()
    
    init(input: ProductsViewModel) {
        self.input = input
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(input.products, id: \.self) { product in
                        HStack {
                            Image(systemName: product.icon)
                                .foregroundColor(Color.yellow)
                            Text(product.title)
                            Spacer()
                            Text(product.ratingString)
                        }.padding(.horizontal)
                            .padding(.bottom, 4)
                    }
                }
            }.navigationBarHidden(true)
        }.onTapGesture {
            hideKeyboard()
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//
// MARK: - Previews
//
#if canImport(SwiftUI) && DEBUG
struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        let products: Products? = LoadJsonData.loadJson(filename: "ProductList")
        ProductsView(input: .init(products?.products?.asProductArray() ?? [],
                                  validator: ProductListModelValidator(),
                                  dataSource: ProductsDataSource()))
    }
}
#endif
