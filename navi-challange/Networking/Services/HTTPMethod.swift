//
//  HTTPMethod.swift
//  navi-challange
//
//  Created by Aman Chawla on 01/07/22.
//

import Foundation

typealias HTTPHeaders = [String: String]

enum HTTPMethod: String {
    case get  = "GET"
    case post   = "POST"
    case put    = "PUT"
    case patch  = "PATCH"
    case delete = "DELETE"
}
