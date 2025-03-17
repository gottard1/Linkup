//
//  AuthSession.swift
//  Shared
//
//  Created by Marcel Felipe Gottardi Anesi on 17/03/25.
//

import Foundation

struct AuthSession {
    private static let authTokenKey = "authToken"
    
    static var authToken: String? {
        get { UserDefaults.standard.string(forKey: authTokenKey) }
        set {
            if let token = newValue {
                UserDefaults.standard.setValue(token, forKey: authTokenKey)
            } else {
                UserDefaults.standard.removeObject(forKey: authTokenKey)
            }
        }
    }
    
    static var isAuthenticated: Bool {
        return authToken != nil
    }
}
