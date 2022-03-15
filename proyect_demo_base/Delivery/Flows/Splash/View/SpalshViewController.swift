//
//  SpalshViewController.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//  
//


import UIKit

class SpalshViewController: UIViewController {
    
    private var presenter: SpalshPresenter
    
    init(presenter: SpalshPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticate()
    }
    
    func authenticate() {
        self.showHud()
        
        presenter.authenticate(completion: { [weak self] result in
            guard let self = self else { return }
                
            if result {
                // TODO: - implement success logic
            } else {
                // TODO: - implement error logic
            }
            self.hideHud()
        })
    }
}
