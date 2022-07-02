//
//  Pull.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation

struct Pull {
    var id: Int
    var title: String
    //var user: User
    var number: Int
    var state: String
    var createdAt: String
    var updatedAt: String
}

extension Pull: Decodable {
    
    enum PullCodingKeys: String, CodingKey {
        case id
        case title
        //case user
        case number
        case state
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PullCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        //user = try container.decode(User.self, forKey: .user)
        number = try container.decode(Int.self, forKey: .number)
        state = try container.decode(String.self, forKey: .state)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        updatedAt = try container.decode(String.self, forKey: .updatedAt)
    }
}
