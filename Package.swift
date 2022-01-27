// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VIPERGen",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .executable(name: "VIPERGen",
                    targets: ["VIPERGen"]),
        .library(name: "VIPERGenKit",
                 targets: ["VIPERGenKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(name: "VIPERGen",
                          dependencies: [
                              "VIPERGenKit",
                              .product(name: "ArgumentParser", package: "swift-argument-parser"),
                          ]),
        .target(name: "VIPERGenKit",
                dependencies: []),
        .testTarget(
            name: "VIPERGenTests",
            dependencies: ["VIPERGen"]),
    ]
)
