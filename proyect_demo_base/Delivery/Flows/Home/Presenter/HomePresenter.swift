//
//  HomePresenter.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import Foundation
import Combine

protocol HomePresenterProtocol {
    var result: [String] { get set }
}

final class HomePresenter: HomePresenterProtocol, ObservableObject {
    var result: [String] = []
    
    private let interactor: HomeInteractorProtocol
    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }
}
