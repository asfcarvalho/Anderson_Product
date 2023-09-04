//
//  ProductsRouterRouter.swift
//  Anderson_Products
//
//  Created by Anderson F Carvalho on 04/09/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import BaseUI
import DataModules

class ProductsRouter{
    
    private(set) weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
        
    class func build() -> UIHostingController<ProductsView> {
        let dataSource = ProductsDataSource()
        let validator = ProductListModelValidator()
        let viewModel = ProductsViewModel(validator: validator, dataSource: dataSource)
        let rootView = ProductsView(input: viewModel)
        let viewController = ProductsViewController(rootView: rootView)
        viewModel.router = ProductsRouter(viewController: viewController)
        
        return viewController
    }
    
    func perform(action: Router.ProductsRouter.ViewOutput.Acion) {
        switch action {
        case .sample:
            break
        case .dismiss:
            viewController?.dismiss(animated: true)
        }
    }
}

public extension Router {
    enum ProductsRouter {
        public enum ViewOutput {
            public enum Acion: Hashable {
                case sample
                case dismiss
            }
        }
    }
}
