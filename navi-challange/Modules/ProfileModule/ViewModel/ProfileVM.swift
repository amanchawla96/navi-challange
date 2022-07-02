//
//  ProfileVM.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation

protocol ProfileVMDelegate: AnyObject {
    func reloadTable()
}

class ProfileVM {
    
    //MARK: - Variables & Constents
    weak var coordinator: ProfileCoordinator?
    weak var delegate: ProfileVMDelegate?
    
    private let networkManager = NetworkManager()
    
    private var user: User?
    private var repos: [Repository] = []
    
    //MARK: - Init
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
        
        self.fetchUser()
        self.fetchRepos()
    }
    
    private func fetchUser() {
        networkManager.getUser(with: "amanchawla96") { [weak self] (user, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("user error: \(error)")
            }
            
            if let user = user {
                self.user = user
                self.delegate?.reloadTable()
            }
        }
    }
    
    private func fetchRepos() {
        networkManager.getRepo("navi-challange", for: "amanchawla96") { [weak self] (repo, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("user error: \(error)")
            }
            
            if let repo = repo {
                self.repos = [repo]
                self.delegate?.reloadTable()
            }
        }
    }
}

//MARK: - Getters
extension ProfileVM {
    
    var numberofRepos: Int {
        repos.count
    }
    
    func repo(at indexPath: IndexPath) -> Repository {
        repos[indexPath.row]
    }
    
    func createRepoVM(for indexPath: IndexPath) -> RepoVM {
        RepoVM(repo: repo(at: indexPath))
    }
    
    func createUserVM() -> UserVM? {
        guard let user = user else { return nil }
        return UserVM(user: user)
    }
}
