//
//  UITableView+Extension.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import UIKit

public extension UITableView {
    func hideFooterView() {
        self.tableFooterView = UIView(frame: .zero)
    }
}
