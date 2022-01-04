// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Coordinator",
	platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Coordinator",
            targets: ["Coordinator"]
		)
    ],
    dependencies: [
		.package(name: "ViewAdditions", path: "../ViewAdditions"),
		.package(name: "Views", path: "../Views")
	],
    targets: [
        .target(
            name: "Coordinator",
            dependencies: ["ViewAdditions", "Views"]
		),
        .testTarget(
            name: "CoordinatorTests",
            dependencies: ["Coordinator"]
		)
    ]
)
