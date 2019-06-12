//
//  RequestMaker.swift
//  Pokedex
//
//  Created by William Cardozo on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class RequestMaker {
    
    enum Endpoint {
        case list
        case details(query: String)
        case moves
        
        var url: String {
            switch self {
            case .list:
                return "list"
            case let .details(query):
                return "details/\(query)"
            case .moves:
                return "moves"
            }
        }
    }
    
    let baseUrl = "http://localhost:3000/"
    let session = URLSession.shared
    typealias CompletionCallback<T: Decodable> = (T) -> Void
    
    func make<T: Decodable>(withEndpointUrl endpointUrl: Endpoint, completion: @escaping CompletionCallback<T>) {
        guard let url = URL(string: "\(baseUrl)\(endpointUrl.url)") else {
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else {
                print("nao veio")
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                
                completion(decodedObject)
            } catch let error {
                print(error)
            }
        }
        
        dataTask.resume()
        
    }
}
