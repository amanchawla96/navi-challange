//
//  AppFonts.swift
//  navi-challange
//
//  Created by Aman Chawla on 02/07/22.
//

import Foundation
import UIKit

enum AppFonts: String {
    case light
    case regular
    case medium
    case semibold
    case bold
    
    private var uiFontWeight: UIFont.Weight {
        switch self {
        case .light:
            return .light
        case .regular:
            return .regular
        case .medium:
            return .medium
        case .semibold:
            return .semibold
        case .bold:
            return .bold
        }
    }
    
    func with(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: self.uiFontWeight)
    }
}
