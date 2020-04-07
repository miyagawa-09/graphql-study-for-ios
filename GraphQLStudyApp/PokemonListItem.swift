//
//  PokemonListItem.swift
//  GraphQLStudyApp
//
//  Created by Masataka Miyagawa on 2020/04/06.
//  Copyright © 2020 Masataka Miyagawa. All rights reserved.
//

import Foundation

public struct PokemonListItem {
    public var id: String
    public let name: String
    public let image: String
}

public struct PokemonDetailItem {
    public var id: String
    public let number: String
    public let name: String
    public let image: String
    public let types: [String]
    public let weaknesses: [String]
    public let evolutions: [String]
}
