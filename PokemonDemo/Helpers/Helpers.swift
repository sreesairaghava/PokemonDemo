//
//  Helpers.swift
//  PokemonDemo
//
//  Created by Sree Sai Raghava Dandu on 24/11/23.
//

import Foundation

extension Bundle {
    func decode<T:Codable>(file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Couldn't decode \(file) from bundle.")
        }
        return loadedData
    }
    
    func fetchData<T:Decodable>(url: String, model: T.Type, completion: @escaping(T) -> Void, failure: @escaping(Error) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }
        .resume()
    }
}
