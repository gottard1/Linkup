//
//  LoginRouter.swift
//  Login
//
//  Created by Marcel Felipe Gottardi Anesi on 11/03/25.
//

import SwiftUI

public class LoginRouter: ObservableObject {
    @Published public var path = NavigationPath()
    
    public init() {}
    
    public func pushToHome() {
        path.append(LoginDestination.home)
    }
    
    public func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}

public enum LoginDestination: Hashable {
    case home
}
