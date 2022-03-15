//
//  SpalshInteractorDependencies.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import Foundation
import Combine

protocol SpalshInteractorDependenciesProtocol {
    func authenticate(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher< SplashDTO, Error>
}

class SpalshInteractorDependencies: SpalshInteractorDependenciesProtocol {
    
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

extension SpalshInteractorDependencies: RequestProtocol {
    func authenticate(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher< SplashDTO, Error> {
        execute(feedKind.request(query: query), decodingType: SplashDTO.self, retries: 1)
    }
}
