//
//  ParameterEncoder.swift
//  navi-challange
//
//  Created by Aman Chawla on 01/07/22.
//

import Foundation

typealias Parameters = [String: Any]

protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
