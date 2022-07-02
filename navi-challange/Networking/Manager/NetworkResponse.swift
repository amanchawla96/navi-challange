//
//  NetworkResponse.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You are not authenticated"
    case badRequest = "Bad request"
    case outdated = "the url you requested is outdated"
    case failed = "Network request failed"
    case noData = "reponse returned with no data to decode"
    case unableToDecode = "we could not decode the reponse"
    
    static func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
