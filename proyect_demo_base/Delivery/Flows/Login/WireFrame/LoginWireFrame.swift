//
//  LoginWireFrame.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import UIKit

protocol LoginWireFrameProtocol {
   static func makeLoginView() -> UIViewController
}

struct LoginWireFrame: LoginWireFrameProtocol {
    static func makeLoginView() -> UIViewController {
        
        let interactorDependencies = LoginInteractorDependencies()
        let interactor = LoginInteractor(dependencies: interactorDependencies)
        let presenter = LoginPresenter(interactor: interactor)
        let view = LoginViewController(presenter: presenter)
        
        return view
    }
}
