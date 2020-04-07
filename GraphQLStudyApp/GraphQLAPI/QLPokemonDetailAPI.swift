// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetPokemonDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetPokemonDetail($id: String) {
      pokemon(id: $id) {
        __typename
        id
        number
        name
        types
        weaknesses
        image
        evolutions {
          __typename
          id
          name
        }
      }
    }
    """

  public let operationName: String = "GetPokemonDetail"

  public var id: String?

  public init(id: String? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("pokemon", arguments: ["id": GraphQLVariable("id")], type: .object(Pokemon.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemon: Pokemon? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "pokemon": pokemon.flatMap { (value: Pokemon) -> ResultMap in value.resultMap }])
    }

    public var pokemon: Pokemon? {
      get {
        return (resultMap["pokemon"] as? ResultMap).flatMap { Pokemon(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "pokemon")
      }
    }

    public struct Pokemon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Pokemon"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("number", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("types", type: .list(.scalar(String.self))),
        GraphQLField("weaknesses", type: .list(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("evolutions", type: .list(.object(Evolution.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, number: String? = nil, name: String? = nil, types: [String?]? = nil, weaknesses: [String?]? = nil, image: String? = nil, evolutions: [Evolution?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pokemon", "id": id, "number": number, "name": name, "types": types, "weaknesses": weaknesses, "image": image, "evolutions": evolutions.flatMap { (value: [Evolution?]) -> [ResultMap?] in value.map { (value: Evolution?) -> ResultMap? in value.flatMap { (value: Evolution) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of an object
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The identifier of this Pokémon
      public var number: String? {
        get {
          return resultMap["number"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "number")
        }
      }

      /// The name of this Pokémon
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The type(s) of this Pokémon
      public var types: [String?]? {
        get {
          return resultMap["types"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "types")
        }
      }

      /// The type(s) of Pokémons that this Pokémon weak to
      public var weaknesses: [String?]? {
        get {
          return resultMap["weaknesses"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "weaknesses")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      /// The evolutions of this Pokémon
      public var evolutions: [Evolution?]? {
        get {
          return (resultMap["evolutions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Evolution?] in value.map { (value: ResultMap?) -> Evolution? in value.flatMap { (value: ResultMap) -> Evolution in Evolution(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Evolution?]) -> [ResultMap?] in value.map { (value: Evolution?) -> ResultMap? in value.flatMap { (value: Evolution) -> ResultMap in value.resultMap } } }, forKey: "evolutions")
        }
      }

      public struct Evolution: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Pokemon"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Pokemon", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of this Pokémon
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}
