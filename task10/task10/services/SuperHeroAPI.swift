//
//  SuperHeroAPI.swift
//  task10
//
//  Created by Алан Абзалханулы on 21.11.2024.
//
import UIKit

class SuperHeroAPI {
    func fetchData(from url: String, completion: @escaping (SuperHero?, Error?) -> Void) {
        guard let requestURL = URL(string: url) else {
            completion(nil, URLError(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: requestURL) { data, _, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, URLError(.badServerResponse))
                return
            }
            
            do {
                let hero = try JSONDecoder().decode(SuperHero.self, from: data)
                completion(hero, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
