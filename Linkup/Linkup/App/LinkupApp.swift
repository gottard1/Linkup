//
//  LinkupApp.swift
//  Linkup
//
//  Created by Marcel Felipe Gottardi Anesi on 17/03/25.
//

import SwiftUI

@main
struct LinkupApp: App {
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.start()
        }
    }
}

