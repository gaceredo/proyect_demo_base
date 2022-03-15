//
//  Feed.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

enum Feed {
    case login
    case authenticate
    case home
}

extension Feed: Endpoint {
    
    var httpMethod: RequestMethod {
        switch self {
        case .authenticate, .home:
            return .GET
        case .login:
            return .POST
        }
        
    }
    
    var path: String {
        switch self {
        case .authenticate:
            return "/api/authenticate"
        case .login:
            return "/api/login"
        case .home:
            return "/api/home"
        }
    }
}
