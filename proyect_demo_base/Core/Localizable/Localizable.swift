//
//  Localizable.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

enum Localizable {
    
    enum Splash: String, LocalizableString {
        var screen: String { "Splash" }
        case title
        case details
    }
    
    enum Login: String, LocalizableString {
        var screen: String { "Login" }
        case title
    }
    
    enum Home: String, LocalizableString {
        var screen: String { "Home" }
        case title
    }
    
}
