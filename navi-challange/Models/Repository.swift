//
//  Repository.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation

struct Repository {
    var id: Int
    var name: String
    var desc: String
    var `private`: Bool
    var language: String
    var createdAt: String
    var updatedAt: String
    
    //var owner: User
}

extension Repository: Decodable {
    
    enum RepositoryCodingKeys: String, CodingKey {
        case id
        case name
        case desc = "description"
        case `private` = "private"
        case language
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        
        //case owner
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RepositoryCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        desc = try container.decode(String.self, forKey: .desc)
        `private` = try container.decode(Bool.self, forKey: .private)
        language = try container.decode(String.self, forKey: .language)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        updatedAt = try container.decode(String.self, forKey: .updatedAt)
        
        //owner = try container.decode(User.self, forKey: .owner)
    }
}
