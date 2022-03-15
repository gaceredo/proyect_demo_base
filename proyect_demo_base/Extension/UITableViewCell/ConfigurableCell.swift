//
//  ConfigurableCell.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

public protocol ConfigurableCell: ReusableCell {
    associatedtype DataType
    func configure(data: DataType)
}
