//
//  RMImageManager.swift
//  RickAndMortyApp
//
//  Created by User on 18/07/23.
//

import Foundation

final class RMImageManager {
    static let shared = RMImageManager()
    
    private init() {}
    
    public func donwloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
