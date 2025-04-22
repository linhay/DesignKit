// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignKit",
    platforms: [.macOS(.v15), .iOS(.v17)],
    products: [
        .library(name: "DesignKit", targets: ["DesignKit"]),
    ],
    dependencies: [
        .package(url: "git@github.com:Lakr233/ColorfulX.git", from: "5.6.4")
    ],
    targets: [
        .target(name: "DesignKit", dependencies: [
            "ColorfulX"
        ]),
        .testTarget(
            name: "DesignKitTests",
            dependencies: ["DesignKit"]
        ),
    ]
)
