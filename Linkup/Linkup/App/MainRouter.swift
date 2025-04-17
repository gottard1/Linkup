//
//  MainRouter.swift
//  Linkup
//
//  Created by Marcel Felipe Gottardi Anesi on 17/03/25.
//

import SwiftUI

import Login
import Home
import Profile
import TabBar

public class MainRouter: ObservableObject {
    @Published public var homeRouter = HomeRouter()
    @Published public var profileRouter = ProfileRouter()
    @Published public var tabBarRouter = TabBarRouter()
    @Published public var loginRouter = LoginRouter()
    
    public init() {}
}
