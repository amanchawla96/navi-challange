//
//  NetworkManager.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation

enum NetworkEnvironment {
    case production
    case development
    case stagging
}

struct NetworkManager {
    
    static let environment: NetworkEnvironment = .production
    static let APIKey = ""
    
    private let router = URLSessionRouter<GitHubAPI>()
}
