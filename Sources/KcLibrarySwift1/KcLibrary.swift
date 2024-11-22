import Foundation
import Security
import KeychainSwift

public struct KeyChainKc {
    
    public init() {}
    
    @discardableResult public func saveKC(_ key: String, value: String) -> Bool {
        if let data = value.data(using: .utf8) {
            let keychain = KeychainSwift()
            keychain.set(value, forKey: key)
            return true
        }else {
            return false
        }
        
    }
    
    public func loadKC(key: String) -> String? {
        let keychain = KeychainSwift()
        if let data = keychain.get(key) {
            return data
        }else {
            return ""
        }
    }
    
    @discardableResult public func deleteKC(key: String) -> Bool {
        let keychain = KeychainSwift()
        keychain.delete(key)
        return true
    }
}
