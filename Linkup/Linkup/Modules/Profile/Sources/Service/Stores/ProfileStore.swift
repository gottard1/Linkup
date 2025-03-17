//
//  ProfileStore.swift
//  Profile
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Foundation
import Combine
import Networking

@MainActor
class ProfileStore: ObservableObject {
    @Published var profile: Profile?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchProfile() {
        isLoading = true
        errorMessage = nil
        
        networkService.fetch(from: ProfileEndpoints.getProfile, responseType: Profile.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = "Erro: \(error.localizedDescription)"
                }
            }, receiveValue: { profile in
                self.profile = profile
            })
            .store(in: &cancellables)
    }
}
