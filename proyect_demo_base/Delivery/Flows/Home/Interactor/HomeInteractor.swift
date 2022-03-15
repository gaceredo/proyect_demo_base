//
//  HomeInteractor.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import Foundation

protocol HomeInteractorProtocol {
    
}

final class HomeInteractor: HomeInteractorProtocol {
    private let dependencies: HomeInteractorDependenciesProtocol
    
    init(dependencies: HomeInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
