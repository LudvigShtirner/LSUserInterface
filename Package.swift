// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

struct RemotePackage {
    let name: String
    let productName: String
    let url: String
    
    init(name: String,
         productName: String? = nil,
         url: String) {
        self.name = name
        self.productName = productName ?? name
        self.url = url
    }
}

private let lsUserInterface = "LSUserInterface"
private let lsUserInterfaceTests = "LSUserInterfaceTests"

private let supportCode = RemotePackage(name: "SupportCode",
                                        url: "https://github.com/LudvigShtirner/SupportCode.git")
private let snapKit = RemotePackage(name: "SnapKit",
                                    url: "https://github.com/SnapKit/SnapKit.git")

let package = Package(
    name: lsUserInterface,
    platforms: [.iOS(.v15)],
    products: [
        .library(name: lsUserInterface,
                 targets: [lsUserInterface]),
    ],
    dependencies: [
        .package(url: supportCode.url, branch: "main"),
        .package(url: snapKit.url, (.init(5, 0, 0) ..< .init(6, 0, 0)))
    ],
    targets: [
        .target(name: lsUserInterface,
                dependencies: [
                    .byName(name: supportCode.name),
                    .byName(name: snapKit.name)
                ]),
        .testTarget(
            name: lsUserInterfaceTests,
            dependencies: [
                .byName(name: lsUserInterface)
            ]),
    ]
)
