//
//  LoginViewController.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import UIKit

class LoginViewController: UIViewController {
    
    private var presenter: LoginPresenter
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func login(user: String,
               password: String) {
        showHud()
        presenter.login(user: user,
                        password: password) { [weak self] result in
            
            if result {
                // TODO: - implement success logic
            } else {
                // TODO: - implement error logic
            }
            self?.hideHud()
        }
    }
}
