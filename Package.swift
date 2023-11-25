// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let lsUserInterface = "LSUserInterface"
private let lsUserInterfaceTests = "LSUserInterfaceTests"

private let supportCode = "SupportCode"
private let supportCodeURL = "https://github.com/LudvigShtirner/SupportCode.git"

private let snapKit = "SnapKit"
private let snapKitURL = "https://github.com/SnapKit/SnapKit.git"

let package = Package(
    name: lsUserInterface,
    platforms: [.iOS(.v13)],
    products: [
        .library(name: lsUserInterface,
                 targets: [lsUserInterface]),
    ],
    dependencies: [
        .package(url: supportCodeURL, branch: "main"),
        .package(url: snapKitURL, (.init(5, 0, 0) ..< .init(6, 0, 0)))
    ],
    targets: [
        .target(name: lsUserInterface,
                dependencies: [
                    .byName(name: supportCode),
                    .byName(name: snapKit)
                ]),
        .testTarget(
            name: lsUserInterfaceTests,
            dependencies: [
                .byName(name: lsUserInterface)
            ]),
    ]
)
