// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SBLocationManager",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SBLocationManager",
            targets: ["SBLocationManager"]),
    ],
    targets: [
        .target(
            name: "SBLocationManager",
            dependencies: []),
    ]
)
