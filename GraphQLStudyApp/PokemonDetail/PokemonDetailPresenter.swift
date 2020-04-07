//
//  PokemonDetailPresenter.swift
//  GraphQLStudyApp
//
//  Created by Masataka Miyagawa on 2020/04/06.
//  Copyright © 2020 Masataka Miyagawa. All rights reserved.
//

import Foundation
import Apollo

protocol PokemonDetailPresenterInput {
    func getPokemonDetail(id: String)
}

protocol PokemonDetailPresenterOutput {
    func updateItem(detail: PokemonDetailItem)
}

final class PokemonDetailPresenter: PokemonDetailPresenterInput {
    private var view: PokemonDetailPresenterOutput!

    let apollo: ApolloClient = {
        let url = URL(string: "https://graphql-pokemon.now.sh")!
        
        return ApolloClient(
            networkTransport: HTTPNetworkTransport(
                url: url
            )
        )
    }()
    
    init(view: PokemonDetailPresenterOutput) {
        self.view = view
    }

    func getPokemonDetail(id: String) {
        self.apollo.fetch(query: GetPokemonDetailQuery(id: id)) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    var types = [String]()
                    var weaknesses = [String]()
                    var evolutions = [String]()

                    if let count = data.pokemon?.types?.count {
                        for i in 0..<count {
                            let type = data.pokemon?.types![i]
                            types.append(type!)
                        }
                    }
                    
                    if let count = data.pokemon?.weaknesses?.count {
                        for i in 0..<count {
                            let weakness = data.pokemon?.weaknesses![i]
                            weaknesses.append(weakness!)
                        }
                    }
                    
                    if let count = data.pokemon?.evolutions?.count {
                        for i in 0..<count {
                            let evolution = data.pokemon?.evolutions![i]?.name
                            evolutions.append(evolution!)
                        }
                    }

                    let detailItem = PokemonDetailItem(
                        id: data.pokemon?.id ?? "",
                        number: data.pokemon?.number ?? "",
                        name: data.pokemon?.name ?? "",
                        image: data.pokemon?.image ?? "",
                        types: types,
                        weaknesses: weaknesses,
                        evolutions: evolutions)
                    // print(detailItem)
                    // 表示更新
                    DispatchQueue.main.async {
                        self.view.updateItem(detail: detailItem)
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
