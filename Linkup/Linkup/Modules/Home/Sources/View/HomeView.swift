//
//  HomeView.swift
//  Linkup
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Shared

import SwiftUI

public struct HomeView: View {
    @StateObject private var homeStore = HomeStore()
    @EnvironmentObject private var router: HomeRouter
    @EnvironmentObject private var session: SessionManager
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                if homeStore.isLoading {
                    ProgressView("Carregando...")
                } else if let errorMessage = homeStore.errorMessage {
                    Text(errorMessage).foregroundColor(.red)
                } else {
                    List(homeStore.posts) { post in
                        Button {
                            router.pushToDetails()
                        } label: {
                            VStack(alignment: .leading) {
                                Text(post.title)
                                    .font(.headline)
                                Text(post.body)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sair") {
                        session.logout()
                    }
                }
            }
            .onAppear {
                homeStore.fetchPosts()
            }
            .navigationDestination(for: HomeDestination.self) { destination in
                switch destination {
                    case .details:
                        Text("Detalhes do Post") // aqui você pode trocar pela sua view real
                }
            }
        }
    }
}
