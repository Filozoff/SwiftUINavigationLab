// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewAdditions",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ViewAdditions",
            targets: ["ViewAdditions"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ViewAdditions",
            dependencies: []
        ),
        .testTarget(
            name: "ViewAdditionsTests",
            dependencies: ["ViewAdditions"]
        )
    ]
)
