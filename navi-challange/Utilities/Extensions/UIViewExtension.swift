//
//  UIViewExtension.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation
import UIKit

//MARK: - Visual Constraints
extension UIView {
    
    func addConstraint(with format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                      options: NSLayoutConstraint.FormatOptions(),
                                                      metrics: nil,
                                                      views: viewsDict))
    }
    
}
