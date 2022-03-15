//
//  KeychainSwift+Extension.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation
import KeychainSwift

class KeychainLoadHash {
    var hash: String? {
        let keychain = KeychainSwift()
        return keychain.get("proyect_demo_base.user.hash")
    }
}

struct KeychainSaveHash {
    func save(hash: String) {
        let keychain = KeychainSwift()
        keychain.set(hash, forKey: "proyect_demo_base.user.hash")
    }
}

struct KeychainRemoveHash {
    func remove() {
        let keychain = KeychainSwift()
        keychain.delete("proyect_demo_base.user.hash")
    }
}
