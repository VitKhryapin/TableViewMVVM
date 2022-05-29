//
//  NetworkService.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getObjects(completion: @escaping (Result<Object?, Error>) -> ())
}

class NetworkService: NetworkServiceProtocol {
    func getObjects(completion: @escaping (Result<Object?, Error>) -> ()) {
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode(Object.self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


