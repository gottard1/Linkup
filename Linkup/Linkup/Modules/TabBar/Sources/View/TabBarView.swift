//
//  TabBarView.swift
//  TabBar
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import SwiftUI

import Home
import Profile

public struct TabBarView: View {
    @StateObject private var coordinator = TabBarCoordinator()
    
    public init() {}
    
    public var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(TabBarCoordinator.Tab.home)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(TabBarCoordinator.Tab.profile)
        }
        .environmentObject(coordinator)
        .environmentObject(coordinator.homeCoordinator)
        .environmentObject(coordinator.profileCoordinator)
    }
}
