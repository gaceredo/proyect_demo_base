//
//  UICollectionView+Register.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import UIKit

extension UICollectionView {
    
    func registerIdentifier<T: UICollectionViewCell>(_: T.Type) where T: ReusableCell {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UICollectionViewCell>(_: T.Type) where T: ReusableCell {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.xibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableaCell<T>(forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
}
