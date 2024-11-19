//
//  KeyChain.swift
//  KCLibrarySwift
//
//  Created by Hernán Rodríguez on 19/11/24.
//

import Foundation
import Security
import KeychainSwift

public struct KeyChainKC {
    
    @discardableResult public static func saveKC(key: String, value: String) -> Bool {
        if let data = value.data(using: .utf8) {
            let keychain = KeychainSwift()
            return keychain.set(data, forKey: key)
        } else {
            return false
        }
    }
    
    public func loadKC(key: String) -> String? {
        let keychain = KeychainSwift()
        if let data = keychain.get(key) {
            return data
        } else {
            return ""
        }
    }
    
    @discardableResult public static func deleteKC(key: String) -> Bool {
        let keychain = KeychainSwift()
        return keychain.delete(key)
    }
}
