//
//  HTTPTask.swift
//  navi-challange
//
//  Created by Aman Chawla on 01/07/22.
//

import Foundation

enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders?)
}
