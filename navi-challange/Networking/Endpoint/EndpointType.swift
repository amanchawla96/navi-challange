//
//  EndpointType.swift
//  navi-challange
//
//  Created by Aman Chawla on 01/07/22.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

