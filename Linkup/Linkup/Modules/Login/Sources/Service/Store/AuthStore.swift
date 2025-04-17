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
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let networkService: NetworkServiceProtocol
    private let session: SessionManager
    
    init(
        networkService: NetworkServiceProtocol = NetworkService(),
        session: SessionManager
    ) {
        self.networkService = networkService
        self.session = session
    }
    
    func login(email: String, password: String) {
        isLoading = true
        errorMessage = nil
        
        networkService
            .fetch(from: AuthEndpoints.login(email: email, password: password), responseType: LoginResponse.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = "Erro: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] response in
                self?.session.login(token: response.token)
            })
            .store(in: &cancellables)
    }
    
    func logout() {
        session.logout()
    }
}
