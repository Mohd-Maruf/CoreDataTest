//
//  NetworkManager.swift
//  LeLabByMaruf
//
//  Created by Mohammad Maruf on 27/04/21.
//  Copyright © 2021 Mohammad Maruf. All rights reserved.
//

import Foundation


class NetworkManager {
    
    private init() { }
    
    static let shared = NetworkManager()
    
    let baseUrl = "https://jsonplaceholder.typicode.com/users"
    
    func getUsersService(_ completion: @escaping (Result<[NSDictionary], Error>) -> ()) {
        debugPrint("URL: \(baseUrl)")
        
        guard let url = URL(string: baseUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(.failure(err))
                return
            }
            guard let data = data else { return }
            
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary] {
                    completion(.success(convertedJsonIntoDict))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
