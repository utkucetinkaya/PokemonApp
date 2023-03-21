//
//  Router.swift
//  PokemonApp
//
//  Created by Utku Çetinkaya on 22.03.2023.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case getPokemonList
    case getPokemonDetail(id: Int)

    var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2")!
    }

    var method: HTTPMethod {
        switch self {
        case .getPokemonList, .getPokemonDetail:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getPokemonList:
            return "/pokemon"
        case .getPokemonDetail(let id):
            return "/pokemon/\(id)"
        }
    }

    var headers: HTTPHeaders {
        return [:]
    }

    var parameters: Parameters? {
        return nil
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.headers = headers

        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
