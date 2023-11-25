//
//  PokemonDetailView.swift
//  PokemonDemo
//
//  Created by Sree Sai Raghava Dandu on 24/11/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            VStack(spacing: 10) {
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                Text("**Weight**: \(vm.formatHeightWeight(value: vm.pokemonDetails?.weight ?? 0)) KG")
                Text("**Height**: \(vm.formatHeightWeight(value: vm.pokemonDetails?.height ?? 0)) M")
            }
            .padding()
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
