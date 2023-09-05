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
import LocalDatabase

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
                    LazyVStack {
                        ForEach(Array(input.products.enumerated()),
                                id: \.element) { index, product in
                            Button {
                                output.value.send(.showDetail(product))
                            } label: {
                                HStack {
                                    Image(systemName: product.icon)
                                        .foregroundColor(Color.yellow)
                                    Text(product.title)
                                        .foregroundColor(Color.black)
                                    Spacer()
                                    Text(product.ratingString)
                                        .foregroundColor(Color.black)
                                }.frame(minHeight: 30)
                                    .padding(.horizontal)
                                    .padding(.bottom, 4)
                                    .onAppear {
                                        output.value.send(.shuldCallNextPage(index))
                                    }
                            }
                        }
                        if input.isLoading {
                            ProgressView()
                        }
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
struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        let products: Products? = LoadJsonData.loadJson(filename: "ProductList")
        ProductsView(input: .init(products?.products?.asProductArray() ?? [],
                                  validator: ProductListModelValidator(),
                                  dataSource: ProductsDataSource(), localData: ProductStorageRepository()))
    }
}
#endif
