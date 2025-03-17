//
//  ProfileView.swift
//  Linkup
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import SwiftUI

public struct ProfileView: View {
    @StateObject private var profileStore = ProfileStore()
    
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(profileStore.profile?.name ?? "")
                    .font(.headline)
                Text(profileStore.profile?.email ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .navigationTitle("Usuários")
            .onAppear {
                profileStore.fetchProfile()
            }
        }
    }
}
