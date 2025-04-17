//
//  AuthSession.swift
//  Shared
//
//  Created by Marcel Felipe Gottardi Anesi on 17/03/25.
//


import Foundation
import SwiftUI

public protocol SessionControlling: ObservableObject {
    var authToken: String? { get }
    var isAuthenticated: Bool { get }
    func login(token: String)
    func logout()
}

public class SessionManager: ObservableObject, SessionControlling {
    @AppStorage("authToken") public var authToken: String?
    @AppStorage("isAuthenticated") public var isAuthenticated: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }
    
    public init() {
        // Apenas para desenvolvimento/testes
        self.isAuthenticated = false
        self.authToken = nil
    }
    
    public func login(token: String) {
        self.authToken = token
        self.isAuthenticated = true
    }
    
    public func logout() {
        self.authToken = nil
        self.isAuthenticated = false
    }
    
    public var hasValidToken: Bool {
        // Aqui você pode adicionar lógica de expiração, se salvar a validade
        return authToken != nil && !authToken!.isEmpty
    }
}
