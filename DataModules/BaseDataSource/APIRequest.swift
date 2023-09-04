//
//  APIRequest.swift
//  DataModules
//
//  Created by Anderson F Carvalho on 04/09/23.
//

import Foundation

public class APIRequest {
    var baseURL: URL!
    var method = "GET"
    var parameters = [String: String]()
    var queryItems = [URLQueryItem]()
    
    public init(method: String = "GET",
                parameters: [String : String] = [String: String]()) {
        self.method = method
        self.parameters = parameters
    }
    
    func updateBaseURL(_ url: URL) {
        baseURL = url
    }
    
    func updateQueryItems(_ query: [URLQueryItem]) {
        self.queryItems = query
    }
    
    func request() -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = method
        request.url?.append(queryItems: queryItems)
        
        return request
    }
}
