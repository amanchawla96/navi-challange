//
//  RepoVM.swift
//  navi-challange
//
//  Created by Aman Chawla on 03/07/22.
//

import Foundation

protocol RepoVMDelegate: AnyObject {
    func reloadTable()
}

class RepoVM {
    
    //MARK: - Variables & Constents
    weak var coordinator: RepoCoordinator?
    weak var delegate: RepoVMDelegate?
    
    private var networkManager = NetworkManager()
    
    private var pulls: [Pull] = []
    
    var repoName: String
    
    init(coordinator: RepoCoordinator) {
        self.coordinator = coordinator
        self.repoName = coordinator.repoName
        
        fetchPulls()
    }
    
    private func fetchPulls() {
        networkManager.getPullRequests(repoName, for: "amanchawla96") { [weak self] (pulls, error) in
            
            if let error = error {
                print("pulls error: \(error)")
            }
            
            if let pulls = pulls {
                self?.pulls = pulls
                self?.delegate?.reloadTable()
            }
        }
    }
}

//MARK: - Getters
extension RepoVM {
    
    var numberOfPulls: Int {
        pulls.count
    }
    
    func createPullCellVM(for indexPath: IndexPath) -> PullsCellVM {
        return PullsCellVM(title: repoName, pull: pulls[indexPath.row])
    }
}
