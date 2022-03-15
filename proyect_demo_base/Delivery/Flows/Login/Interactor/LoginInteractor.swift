//
//  LoginInteractor.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import Foundation
import Combine

protocol LoginInteractorProtocol {
    func login(body: [String: Any],
               completion: @escaping (Result< LoginUserDTO, Error>) -> Void)
}

final class LoginInteractor: LoginInteractorProtocol {
    
    private let dependencies: LoginInteractorDependenciesProtocol
    private var cancellable: AnyCancellable?
    
    init(dependencies: LoginInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func login(body: [String: Any],
               completion: @escaping (Result< LoginUserDTO, Error>) -> Void) {
        
        cancellable = dependencies.login(.login, body: body)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure(let error):
                    completion(.failure(error))
                }
                
            },receiveValue: { user in
                completion(.success(user))
            })
    }
}
