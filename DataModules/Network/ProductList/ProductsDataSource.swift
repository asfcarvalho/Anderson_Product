//
//  ProductsDataSource.swift
//  DataModules
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import UIKit

public class ProductsDataSource: ProductsDataSourceProtocol {
    
    var apiCalling: APICalling!
    var apiRequest: APIRequest!
    private var token = CancelBag()
    
    public init(apiCalling: APICalling = APICalling(),
                apiRequest: APIRequest = APIRequest()) {
        self.apiCalling = apiCalling
        self.apiRequest = apiRequest
    }
    
    public func fetchProducts(urlString: String? = nil, skip: Int, callBack: @escaping (Result<Products, MyError>) -> Void) {
        let urlString = urlString ?? APIStrings.baseUrl + "/products"
        guard let url = URL(string: urlString),
                UIApplication.shared.canOpenURL(url) else {
            return callBack(.failure(MyError.URLError))
        }
        
        apiRequest.updateBaseURL(url)
        apiRequest.updateQueryItems([URLQueryItem(name: "limit", value: "10"),
                                     URLQueryItem(name: "skip", value: "\(skip)")])
        
        apiCalling.fetch(apiRequest: apiRequest) { response in
            callBack(response)
        }
    }
}
