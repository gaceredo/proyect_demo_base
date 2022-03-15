//
//  ResponseHandlingError.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

class ResponseHandlingError {
    let errors: [Int: ResponseError] = [400: .badRequest,
                                        401: .unauthorized,
                                        403: .forbidden,
                                        404: .notFound,
                                        500: .internalServerError,
                                        501: .notImplemented,
                                        502: .badGateway,
                                        503: .servicesUnavailable]

    func handlingError(statusCode: Int) -> ResponseError {
        guard let error = errors[statusCode] else {
            return handlingGenericError()
        }
        return error
    }

    func handlingGenericError() -> ResponseError {
        return .genericError
    }
}
