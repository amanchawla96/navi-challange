//
//  UserVM.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation
import UIKit

class UserVM {
    
    private var user: User
    
    init(user: User) {
        self.user = user
    }
}

//MARK: - Getters
extension UserVM {
    
    var name: String {
        user.name
    }
    
    var username: String {
        user.username
    }
    
    var followers: Int {
        user.followers
    }
    
    var following: Int {
        user.following
    }
    
    var image: String {
        user.image
    }
}
