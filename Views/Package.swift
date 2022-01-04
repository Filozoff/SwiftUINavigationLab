// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Views",
	platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Views",
            targets: ["Views"]
		),
    ],
    dependencies: [
		.package(name: "ViewAdditions", path: "../ViewAdditions")
	],
    targets: [
        .target(
            name: "Views",
            dependencies: ["ViewAdditions"]
		),
        .testTarget(
            name: "ViewsTests",
            dependencies: ["Views"]
		),
    ]
)
