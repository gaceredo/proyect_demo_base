//
//  SpalshWireFrame.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import UIKit

protocol SpalshWireFrameProtocol {
   static func makeSpalshView() -> UIViewController
}

struct SpalshWireFrame: SpalshWireFrameProtocol {
    static func makeSpalshView() -> UIViewController {
        
        let interactorDependencies = SpalshInteractorDependencies()
        let interactor = SpalshInteractor(dependencies: interactorDependencies)
        let presenter = SpalshPresenter(interactor: interactor)
        let view = SpalshViewController(presenter: presenter)
        
        return view
    }
}
