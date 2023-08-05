// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "FunnyBones",
    platforms: [
        .macOS(.v10_15), .iOS(.v14), .tvOS(.v14)
    ],
    products: [
        .library(
            name: "FunnyBones",
            targets: ["FunnyBones"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FunnyBones",
            dependencies: []),
    ]
)
