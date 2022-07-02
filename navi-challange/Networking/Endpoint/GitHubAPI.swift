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
    case repo(repo: String, username: String)
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
        case .repo(let repo, let username):
            return "repos/\(username)/\(repo)"
        case .pulls(let username, let repo):
            return "repos/\(username)/\(repo)/pulls"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .user(_), .repos(_), .repo(_, _), .pulls(_, _):
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .pulls(_, _):
            return .requestParameters(bodyParameters: nil, urlParameters: ["state": "closed"])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
