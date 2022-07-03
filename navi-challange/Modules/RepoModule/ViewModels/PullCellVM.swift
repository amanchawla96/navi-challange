//
//  PullCellVM.swift
//  navi-challange
//
//  Created by Aman Chawla on 03/07/22.
//

import Foundation

struct PullsCellVM {
    
    //MARK: - Variables & Constents
    var repoTitle: String
    private var pull: Pull
    
    //MARK: - Init
    init(title: String, pull: Pull) {
        self.repoTitle = title
        self.pull = pull
    }
}

//MARK: - Getter
extension PullsCellVM {
    
    var title: String {
        pull.title
    }
    
    var createdAt: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return dateFormatter.date(from: pull.createdAt)!
    }
}
