//
//  AppEnvironment.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

enum AppEnvironment: String {

    case Debug
    case Release

    static let current: AppEnvironment = {
        guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("No Configuration Found")
        }

        guard let configuration = AppEnvironment(rawValue: rawValue) else {
            fatalError("Invalid Configuration")
        }

        return configuration
    }()

    static var baseURL: String {
        switch current {
        case .Debug: return ""
        case .Release: return "http://localhost:8080" // TODO: - Implement url base
        }
    }

}
