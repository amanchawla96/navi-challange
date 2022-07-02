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

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager {
    
    static let environment: NetworkEnvironment = .production
    static let APIKey = ""
    
    private let router = URLSessionRouter<GitHubAPI>()
    
    func getUser(with username: String, completion: @escaping (_ user: User?, _ error: String?) -> ()) {
        router.request(.user(username: username)) { data, response, error in
            guard error == nil else {
                completion(nil, error!.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = NetworkResponse.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let apiReponse = try JSONDecoder().decode(User.self, from: responseData)
                        completion(apiReponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let networkError):
                    completion(nil, networkError)
                }
            }
        }
    }
    
    func getRepo(_ repo: String, for username: String, completion: @escaping (_ repo: Repository?, _ error: String?) -> ()) {
        router.request(.repo(repo: repo, username: username)) { data, response, error in
            guard error == nil else {
                completion(nil, error!.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = NetworkResponse.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let apiReponse = try JSONDecoder().decode(Repository.self, from: responseData)
                        completion(apiReponse, nil)
                    } catch(let error) {
                        completion(nil, error.localizedDescription)
                    }
                    
                case .failure(let networkError):
                    completion(nil, networkError)
                }
            }
        }
    }
    
    func getPullRequests(_ repo: String, for username: String, completion: @escaping (_ pulls: [Pull]?, _ error: String?) -> ()) {
        router.request(.pulls(username: username, repo: repo)) { data, response, error in
            guard error == nil else {
                completion(nil, error!.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = NetworkResponse.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let apiReponse = try JSONDecoder().decode([Pull].self, from: responseData)
                        completion(apiReponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let networkError):
                    completion(nil, networkError)
                }
            }
        }
    }
    
    func getImage(for url: String, completion: @escaping (_ imageData: Data?, _ error: String?) -> ()) {
        router.request(.image(url: url)) { data, response, error in
            guard error == nil else {
                completion(nil, error!.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = NetworkResponse.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    completion(responseData, nil)
                    
                case .failure(let networkError):
                    completion(nil, networkError)
                }
            }
        }
    }
}
