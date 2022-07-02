//
//  AppColors.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation
import UIKit

infix operator |: AdditionPrecedence
public extension UIColor {
    
    /// Easily define two colors for both light and dark mode.
    /// - Parameters:
    ///   - lightMode: The color to use in light mode.
    ///   - darkMode: The color to use in dark mode.
    /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
    static func | (lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return lightMode }
            
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
}

struct AppColors {
    
    static var background: UIColor {
        .systemBackground
    }
    
    static var primary: UIColor {
        UIColor(red: 0.30, green: 0.62, blue: 0.92, alpha: 1.00)
    }
    
    static var successful: UIColor {
        .systemGreen
    }
    
    static var black: UIColor {
        UIColor(red: 0.06, green: 0.06, blue: 0.06, alpha: 1.00)
    }
    
    static var primaryLabel: UIColor {
        UIColor(red: 0.08, green: 0.09, blue: 0.10, alpha: 1.00)
    }
    
    
    static var secondaryLabel: UIColor {
        UIColor(red: 0.41, green: 0.46, blue: 0.52, alpha: 1.00)
    }
    
}
