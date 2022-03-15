//
//  ResponseError.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

public enum ResponseError: Error {
    case ok

    case badRequest
    case unauthorized
    case forbidden
    case notFound

    case internalServerError
    case notImplemented
    case badGateway
    case servicesUnavailable

    case genericError
}
