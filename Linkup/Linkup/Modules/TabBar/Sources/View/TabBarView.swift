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
    @EnvironmentObject var router: TabBarRouter
    
    public init() {}
    
    public var body: some View {
        TabView(selection: $router.selectedTab) {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
                .tag(TabBarRouter.Tab.home)
                .environmentObject(router.homeRouter)
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
                .tag(TabBarRouter.Tab.profile)
                .environmentObject(router.profileRouter)
        }
    }
}
