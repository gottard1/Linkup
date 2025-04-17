//
//  TabBarRouter.swift
//  TabBar
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Home
import Profile

import SwiftUI

public class TabBarRouter: ObservableObject {
    @Published public var selectedTab: Tab = .home
    @Published public var homeRouter: HomeRouter
    @Published public var profileRouter: ProfileRouter
    
    public init(homeRouter: HomeRouter = HomeRouter(), profileRouter: ProfileRouter = ProfileRouter()) {
        self.homeRouter = homeRouter
        self.profileRouter = profileRouter
    }
    
    public enum Tab {
        case home, profile
    }
}
