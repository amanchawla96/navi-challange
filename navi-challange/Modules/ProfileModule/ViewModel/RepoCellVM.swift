//
//  RepoCellVM.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation

struct RepoCellVM {
    
    //MARK: - Variables & Constents
    private var repo: Repository
    
    
    //MARK: - Init
    init(repo: Repository) {
        self.repo = repo
    }
}

//MARK: - Getters
extension RepoCellVM {
    
    var title: String {
        repo.name
    }
    
    var createdAt: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return dateFormatter.date(from: repo.createdAt)!
    }
    
    var language: String {
        repo.language
    }
    
}
