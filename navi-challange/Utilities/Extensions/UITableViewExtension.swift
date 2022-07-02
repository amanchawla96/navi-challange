//
//  UITableViewExtension.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return "\(self)"
    }
    
}

extension UITableView {
    
    func register(with identifier: UITableViewCell.Type) {
        self.register(identifier, forCellReuseIdentifier: identifier.reuseIdentifier)
    }
    
    func registerHeaderFooterView(with identifier: UITableViewHeaderFooterView.Type) {
        self.register(identifier.self, forHeaderFooterViewReuseIdentifier: "\(identifier.self)")
    }
    
    func dequeueCell<T: UITableViewCell>(withIdentifier identifier: T.Type, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue tableViewCell with identifier \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(with identifier: T.Type) -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: "\(identifier.self)") as! T
    }
}
