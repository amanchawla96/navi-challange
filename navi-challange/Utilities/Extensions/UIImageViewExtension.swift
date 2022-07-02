//
//  UIImageViewExtension.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation
import UIKit

fileprivate var imageCache: [String: UIImage] = [:]

extension UIImageView {
    
    func setImage(for url: String) {
        if let image = imageCache[url] {
            self.image = image
        } else {
            NetworkManager().getImage(for: url) { [weak self] (imageData, error) in
                if let error = error {
                    print("user image error: \(error)")
                }
                
                if let imageData = imageData {
                    let image = UIImage(data: imageData)
                    imageCache[url] = image
                    self?.image = image
                }
            }
        }
    }
}
