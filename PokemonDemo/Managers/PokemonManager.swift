//
//  PokemonManager.swift
//  PokemonDemo
//
//  Created by Sree Sai Raghava Dandu on 24/11/23.
//

import Foundation

class PokemonManager {
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "data.json")
        let pokemon: [Pokemon] = data.results
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion:@escaping (DetailPokemon) -> Void) {
        let url = "https://pokeapi.co/api/v2/pokemon/\(id)/"
        Bundle.main.fetchData(url: url, model: DetailPokemon.self) { data in
            completion(data)
            print(data)
        } failure: { error in
            print(error)
        }
    }
}
