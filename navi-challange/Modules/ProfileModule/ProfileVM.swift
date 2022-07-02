//
//  ProfileVM.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation

class ProfileVM {
    
    //MARK: - Variables & Constents
    weak var coordinator: ProfileCoordinator?
    
    
    //MARK: - Init
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
}
