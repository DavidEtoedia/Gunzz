//
//  Fonts.swift
//  Gunzz
//
//  Created by Inyene Etoedia on 17/10/2023.
//

import Foundation
import SwiftUI

enum FontType{
    case usFont
    case nasa
    case futura
}

extension FontType {
    var name: String {
        switch self {
        case .nasa:
            return "NasalizationRg-Regular"
        case .usFont:
            return "U.S.101"
        case .futura:
            return "Futura-Medium"
        }
    }
}


extension Font {
    static func custom (_ font: FontType, size: CGFloat) -> Font {
        return Font.custom(font.name, size: size)
        
    }
}


