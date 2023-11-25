//
//  PokemonView.swift
//  PokemonDemo
//
//  Created by Sree Sai Raghava Dandu on 24/11/23.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimension: Double = 140
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: dimension, height: dimension)
            } placeholder: {
                ProgressView()
                    .frame(width: dimension, height: dimension)
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
