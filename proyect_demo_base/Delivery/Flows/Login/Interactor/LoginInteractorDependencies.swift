//
//  LoginInteractorDependencies.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import Foundation
import Combine

protocol LoginInteractorDependenciesProtocol {
    func login(_ feedKind: Feed, body: [String : Any]) -> AnyPublisher<LoginUserDTO, Error>
}

class LoginInteractorDependencies: LoginInteractorDependenciesProtocol {
    
    var session: URLSession
    var error: ResponseHandlingError
    
    init(configuration: URLSessionConfiguration,
         error: ResponseHandlingError = ResponseHandlingError()) {
        self.session = URLSession(configuration: configuration)
        self.error = error
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
}

extension LoginInteractorDependencies: RequestProtocol {
    
    func login(_ feedKind: Feed, body: [String : Any]) -> AnyPublisher<LoginUserDTO, Error> {
        return execute(feedKind.request(body: body), decodingType: LoginUserDTO.self, retries: 2)
    }
}
