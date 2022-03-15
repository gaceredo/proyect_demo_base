//
//  LocalizableString.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

protocol LocalizableString {
    var rawValue: String { get }
    var table: String? { get }
    var bundle: Bundle { get }
    var localized: String { get }
    var screen: String { get }
}

extension LocalizableString {
    var bundle: Bundle { Bundle.main }

    //returns a localized value by specified key located in the specified table
    var localized: String {
        return bundle.localizedString(forKey: "\(screen).\(rawValue)",
                                      value: nil,
                                      table: table)
    }

    // file name, where to find the localized key
    // by default is the Localizable.string table
    var table: String? {
        return nil
    }
}
