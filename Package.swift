// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LSUserInterface",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "LSUserInterface",
            targets: ["LSUserInterface"]),
    ],
    dependencies: [
        .package(url: "https://github.com/LudvigShtirner/SupportCode.git",
                 branch: "main"),
        .package(url: "https://github.com/SnapKit/SnapKit.git",
                 (.init(5, 0, 0) ..< .init(6, 0, 0)))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LSUserInterface",
            dependencies: ["SupportCode", "SnapKit"]),
        .testTarget(
            name: "LSUserInterfaceTests",
            dependencies: ["LSUserInterface"]),
    ]
)
