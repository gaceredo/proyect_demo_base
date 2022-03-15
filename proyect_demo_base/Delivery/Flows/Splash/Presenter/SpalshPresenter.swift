//
//  SpalshPresenter.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import Foundation
import Combine

protocol SpalshPresenterProtocol {
    var result: SplashDTO? { get set }
    var localizedDescription: String { get set}
    func authenticate(completion: @escaping (Bool) -> Void)
}

final class SpalshPresenter: SpalshPresenterProtocol, ObservableObject {
    
    var result: SplashDTO? = nil
    var localizedDescription: String = ""
    private let interactor: SpalshInteractorProtocol
    
    init(interactor: SpalshInteractorProtocol) {
        self.interactor = interactor
    }
    
    func authenticate(completion: @escaping (Bool) -> Void) {
        
        interactor.authenticate(query: [],
                                completion: { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let element):
                self.result = element
                completion(false)
            case .failure(let error):
                self.localizedDescription = error.localizedDescription
                completion(false)
                
            }
        })
    }
    
}
