//
//  HomeCoordinator.swift
//  Home
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import SwiftUI

public class HomeCoordinator: ObservableObject {
    @Published public var path = NavigationPath()
    
    public init() {}
    
    public func pushToDetails() {
        path.append(HomeDestination.details)
    }
    
    public func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}

public enum HomeDestination: Hashable {
    case details
}
