//
//  LoginPresenter.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import Foundation
import Combine

protocol LoginPresenterProtocol {
    var result: LoginUserDTO? { get set }
    var localizedDescription: String { get set }
    func login(user: String, password: String, completion: @escaping (Bool) -> Void)
}

final class LoginPresenter: LoginPresenterProtocol, ObservableObject {
    
    var result: LoginUserDTO? = nil
    var localizedDescription: String = ""
    private let interactor: LoginInteractorProtocol
    
    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }
    
    func login(user: String,
               password: String,
               completion: @escaping (Bool) -> Void) {
        
        let body = ["email": user,
                    "password": password]
        interactor.login(body: body) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.localizedDescription = error.localizedDescription
                completion(false)
            case .success(let user):
                self.result = user
                completion(true)
            }
        }
    }
}
