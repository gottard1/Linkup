//
//  LoginStore.swift
//  Login
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import Combine
import SwiftUI

import Networking
import Shared

@MainActor
class AuthStore: ObservableObject {
    @AppStorage("isAuthenticated") private var isAuthenticated: Bool = AuthSession.isAuthenticated
    
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func login(email: String, password: String) {
        isLoading = true
        errorMessage = nil
        
        networkService.fetch(from: AuthEndpoints.login(email: email, password: password), responseType: LoginResponse.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = "Erro: \(error.localizedDescription)"
                }
            }, receiveValue: { response in
                AuthSession.authToken = response.token
                self.isAuthenticated = true
            })
            .store(in: &cancellables)
    }
    
    func logout() {
        AuthSession.authToken = nil
        isAuthenticated = false
    }
}
