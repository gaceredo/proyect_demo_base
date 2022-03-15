//
//  ResponseStatusCode.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

enum ResponseStatusCode: Int {
    case ok = 200

    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404

    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case genericError = -999
}
