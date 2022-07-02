//
//  GitHubAPI.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation

enum GitHubAPI {
    case user(username: String)
    case repos(username: String)
    case pulls(username: String, repo: String)
}

extension GitHubAPI: EndpointType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://api.github.com/"
        case .development: return ""
        case .stagging: return ""
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("could not configure base url.") }
        return url
    }
    
    var path: String {
        switch self {
        case .user(let username):
            return "users/\(username)"
        case .repos(let username):
            return "users/\(username)/repos"
        case .pulls(let username, let repo):
            return "repos/\(username)/\(repo)/pulls"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}