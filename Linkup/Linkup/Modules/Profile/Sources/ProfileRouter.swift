//
//  ProfileRouter.swift
//  Profile
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//

import SwiftUI

public class ProfileRouter: ObservableObject {
    @Published public var path = NavigationPath()
    
    public init() {}
    
    public func pushToSettings() {
        path.append(AnyHashable(ProfileDestination.settings))
    }
    
    public func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}

public enum ProfileDestination: Hashable {
    case settings
}
