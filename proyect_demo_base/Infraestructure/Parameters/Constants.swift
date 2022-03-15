//
//  Constants.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

enum Path {
    static var baseImage: String {
        switch AppEnvironment.current {
        case .Debug,
             .Release:  return ""
        }
    }
}
