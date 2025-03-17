// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TabBar",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "TabBar",
            targets: ["TabBar"]),
    ],
    dependencies: [
        .package(path: "../Home"),
        .package(path: "../Profile")
    ],
    targets: [
        .target(
            name: "TabBar",
            dependencies: ["Home", "Profile"]
        ),
        .testTarget(
            name: "TabBarTests",
            dependencies: ["TabBar"]
        ),
    ]
)
