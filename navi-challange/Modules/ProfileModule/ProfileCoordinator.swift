//
//  ProfileCoordinator.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    //MARK: - Variables & Constents
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Navigaton
    func start() {
        let controller = ProfileVC()
        controller.viewModel = ProfileVM(coordinator: self)
        navigationController.pushViewController(controller, animated: false)
    }
    
    func openRepo(with name: String) {
        let child = RepoCoordinator(for: name, navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
