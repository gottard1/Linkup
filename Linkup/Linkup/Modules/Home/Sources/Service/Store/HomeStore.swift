//
//  HomeStore.swift
//  Home
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Foundation
import Combine

import Networking

@MainActor
class HomeStore: ObservableObject {
    @Published private(set) var posts: [Post] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchPosts() {
//        isLoading = true
//        networkService.fetch(from: .posts, responseType: [Post].self)
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                self.isLoading = false
//                if case .failure(let error) = completion {
//                    self.errorMessage = "Erro: \(error)"
//                }
//            }, receiveValue: { posts in
//                self.posts = posts
//            })
//            .store(in: &cancellables)
    }
}
