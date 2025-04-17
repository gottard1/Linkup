//
//  AppRouter.swift
//  Linkup
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Shared
import TabBar
import Login

import SwiftUI
import Combine

public class AppRouter: ObservableObject {
    public let session: SessionManager
    @Published public var mainRouter = MainRouter()
    
    public init(session: SessionManager = SessionManager()) {
        self.session = session
        updateCoordinator(for: session.isAuthenticated)
        
        session.objectWillChange
            .sink { [weak self] in
                guard let self = self else { return }
                self.updateCoordinator(for: self.session.isAuthenticated)
            }
            .store(in: &cancellables)
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
    private func updateCoordinator(for authenticated: Bool) {
        if authenticated {
            mainRouter.tabBarRouter = TabBarRouter()
        } else {
            mainRouter.loginRouter = LoginRouter()
        }
    }
    
    @ViewBuilder
    public func start() -> some View {
        if session.isAuthenticated {
            TabBarView()
                .environmentObject(session)
                .environmentObject(mainRouter.tabBarRouter)
                .environmentObject(mainRouter.homeRouter)
                .environmentObject(mainRouter.profileRouter)
        } else {
            NavigationStack {
                LoginView()
                    .environmentObject(mainRouter.loginRouter)
                    .environmentObject(session)
            }
        }
    }
}
