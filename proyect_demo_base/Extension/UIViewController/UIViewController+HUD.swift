//
//  UIViewController+HUD.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showHud() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }

    func hideHud() {
        MBProgressHUD.hide(for: view, animated: true)
    }

    func showErrorHud(text: String) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = text
        hud.hide(animated: true, afterDelay: 2.0)
    }
}
