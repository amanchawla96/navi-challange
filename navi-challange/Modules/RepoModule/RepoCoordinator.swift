//
//  RepoCoordinator.swift
//  navi-challange
//
//  Created by Aman Chawla on 03/07/22.
//

import Foundation
import UIKit

class RepoCoordinator: Coordinator {
    
    //MARK: - Variables & Constents
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var parentCoordinator: Coordinator?
    
    var repoName: String
    
    init(for name: String, navigationController: UINavigationController) {
        self.repoName = name
        self.navigationController = navigationController
    }
    
    //MARK: - Navigaton
    func start() {
        let controller = RepoVC()
        controller.viewModel = RepoVM(coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func backToParent() {
        parentCoordinator?.childDidFinish(self)
        navigationController.popViewController(animated: true)
    }
}
