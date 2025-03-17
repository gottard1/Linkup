//
//  AppCoordinator.swift
//  Linkup
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import SwiftUI

import Login
import TabBar

class AppCoordinator: ObservableObject {
    @AppStorage("isAuthenticated") private var isAuthenticated: Bool = false
    
    @Published var tabBarCoordinator: TabBarCoordinator?
    @Published var loginCoordinator: LoginCoordinator?
    
    init() {
        updateCoordinator(for: isAuthenticated)
    }
    
    func setAuthenticated(_ authenticated: Bool) {
        guard authenticated != isAuthenticated else { return }
        
        isAuthenticated = authenticated
        updateCoordinator(for: authenticated)
    }
    
    private func updateCoordinator(for authenticated: Bool) {
        if authenticated {
            tabBarCoordinator = TabBarCoordinator()
            loginCoordinator = nil
        } else {
            loginCoordinator = LoginCoordinator()
            tabBarCoordinator = nil
        }
    }
    
    @ViewBuilder
    func start() -> some View {
        if isAuthenticated {
            TabBarView().environmentObject(tabBarCoordinator ?? TabBarCoordinator())
        } else {
            LoginView().environmentObject(loginCoordinator ?? LoginCoordinator())
        }
    }
}
