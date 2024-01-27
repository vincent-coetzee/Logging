// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Logging",
    platforms: [
           .iOS(.v17), // Limit the deployment of this package to iOS 17 and above, this is needed because SystemLogger makes use of the Apple SOLog framework containing the Logger implementation
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Logging",
            targets: ["Logging"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Logging"),
        .testTarget(
            name: "LoggingTests",
            dependencies: ["Logging"]),
    ]
)
