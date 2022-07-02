//
//  User.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation

struct User {
    var id: Int
    var name: String
    var username: String
    var image: String
    var followers: Int
    var following: Int
}

extension User: Decodable {
    
    enum UserCodingKeys: String, CodingKey {
        case id
        case name
        case username = "login"
        case image = "avatar_url"
        case followers
        case following
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        username = try container.decode(String.self, forKey: .username)
        image = try container.decode(String.self, forKey: .image)
        followers = try container.decode(Int.self, forKey: .followers)
        following = try container.decode(Int.self, forKey: .following)
    }
}
