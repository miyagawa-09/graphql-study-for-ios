//
//  Presenter.swift
//  GraphQLStudyApp
//
//  Created by Masataka Miyagawa on 2020/04/06.
//  Copyright © 2020 Masataka Miyagawa. All rights reserved.
//

import Foundation
import Apollo

protocol PokemonListPresenterInput {
    var numberOfPokemons: Int { get }
    func pokemon(forRow row: Int) -> PokemonListItem?
    func createPokemonList()
}

protocol PokemonListPresenterOutput: AnyObject {
    func updateUsers()
}

final class PokemonListPresenter: PokemonListPresenterInput {
    private weak var view: PokemonListPresenterOutput!

    private(set) var pokemons: [PokemonListItem] = []

    var numberOfPokemons: Int {
        return pokemons.count
    }
    
    let apollo: ApolloClient = {
        let url = URL(string: "https://graphql-pokemon.now.sh")!
        
        return ApolloClient(
            networkTransport: HTTPNetworkTransport(
                url: url
            )
        )
    }()
    
    init(view: PokemonListPresenterOutput) {
        self.view = view
    }
    
    func pokemon(forRow row: Int) -> PokemonListItem? {
        guard row < pokemons.count else { return nil }
        return pokemons[row]
    }
    
    func createPokemonList() {
        self.apollo.fetch(query: GetPokemonListQuery()) { result in
            switch result {
            case .success(let graphQLResult):
              if let data = graphQLResult.data {

                var listitems: [PokemonListItem] = []
                if let count = data.pokemons?.count {
                    for i in 0..<count {
                        let item = data.pokemons?[i]
                        
                        listitems.append(PokemonListItem(id: item!.id, name: item?.name  ?? "", image: item?.image ?? ""))
                    }
                }
                self.pokemons = listitems
                
                // 表示更新する処理
                DispatchQueue.main.async {
                    self.view.updateUsers()
                }
                
              } else if let errors = graphQLResult.errors {
                print(errors)
              }
            case .failure(let error):
              // Network or response format errors
              print(error)
            }
        }
    }
}
