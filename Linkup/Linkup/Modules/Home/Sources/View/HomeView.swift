//
//  HomeView.swift
//  Linkup
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import SwiftUI

public struct HomeView: View {
    @StateObject private var homeStore = HomeStore()
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack {
                if homeStore.isLoading {
                    ProgressView("Carregando...")
                } else if let errorMessage = homeStore.errorMessage {
                    Text(errorMessage).foregroundColor(.red)
                } else {
                    List(homeStore.posts) { post in
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
            .navigationTitle("Posts")
            .onAppear {
                homeStore.fetchPosts()
            }
        }
    }
}
