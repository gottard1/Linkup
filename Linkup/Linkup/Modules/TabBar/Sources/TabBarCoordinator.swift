//
//  TabBarCoordinator.swift
//  TabBar
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import Home
import Profile

import SwiftUI

public class TabBarCoordinator: ObservableObject {
    @Published public var selectedTab: Tab = .home
    @Published public var homeCoordinator = HomeCoordinator()
    @Published public var profileCoordinator = ProfileCoordinator()
    
    public init() {}
    
    public enum Tab {
        case home, profile
    }
}
