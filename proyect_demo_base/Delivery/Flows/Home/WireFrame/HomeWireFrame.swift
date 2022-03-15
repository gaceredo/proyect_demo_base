//
//  HomeWireFrame.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import UIKit

protocol HomeWireFrameProtocol {
   static func makeHomeView() -> UIViewController
}

struct HomeWireFrame: HomeWireFrameProtocol {
    static func makeHomeView() -> UIViewController {
        
        let interactorDependencies = HomeInteractorDependencies()
        let interactor = HomeInteractor(dependencies: interactorDependencies)
        let presenter = HomePresenter(interactor: interactor)
        let view = HomeViewController(presenter: presenter)
        
        return view
    }
}
