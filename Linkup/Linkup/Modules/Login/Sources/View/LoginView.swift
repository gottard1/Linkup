//
//  LoginView.swift
//  Login
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import Shared

import SwiftUI

public struct LoginView: View {
    @EnvironmentObject private var router: LoginRouter
    @EnvironmentObject private var session: SessionManager
    
    @StateObject private var authStore: AuthStore
    
    @State private var email = ""
    @State private var password = ""
    
    public init() {
        _authStore = StateObject(wrappedValue: AuthStore(session: SessionManager()))
    }
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            VStack(spacing: 16) {
                if let error = authStore.errorMessage {
                    Text(error).foregroundColor(.red)
                }
                
                TextField("E-mail", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                SecureField("Senha", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Entrar") {
                    authStore.login(email: email, password: password)
                }
                .buttonStyle(.borderedProminent)
                .disabled(email.isEmpty || password.isEmpty || authStore.isLoading)
                
                if authStore.isLoading {
                    ProgressView("Entrando...")
                }
            }
            .padding()
            .onChange(of: session.isAuthenticated) { isAuth in
                if isAuth {
                    router.pushToHome()
                }
            }
            .navigationDestination(for: LoginDestination.self) { destination in
                switch destination {
                    case .home:
                        Color.clear
                }
            }
        }
    }
}
