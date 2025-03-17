//
//  LoginView.swift
//  Login
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import SwiftUI

public struct LoginView: View {
    @ObservedObject var coordinator: LoginCoordinator = .init()
    @State private var email = ""
    @State private var password = ""
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 16) {
            TextField("E-mail", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            SecureField("Senha", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Entrar") {
                if email == "teste@email.com" && password == "123456" {
                    coordinator.pushToHome()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(email.isEmpty || password.isEmpty)
        }
        .padding()
    }
}
