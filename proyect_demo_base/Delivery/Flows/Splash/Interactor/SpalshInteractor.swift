//
//  SpalshInteractor.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import Foundation
import Combine

protocol SpalshInteractorProtocol {
    func authenticate(query: [URLQueryItem],completion: @escaping (Result< SplashDTO, Error>) -> Void)
}

final class SpalshInteractor: SpalshInteractorProtocol {
    
    private let dependencies: SpalshInteractorDependenciesProtocol
    private var cancellable: AnyCancellable?
    
    init(dependencies: SpalshInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func authenticate(query: [URLQueryItem],
                      completion: @escaping (Result< SplashDTO, Error>) -> Void) {
        
        cancellable = dependencies.authenticate(query: query, .authenticate)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure(let error):
                    
                    completion(.failure(error))
                }
            },
                  receiveValue: {
                completion(.success($0))
            })
    }
}
