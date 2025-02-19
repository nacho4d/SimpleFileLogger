// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SimpleFileLogger",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SimpleFileLogger",
            targets: ["SimpleFileLogger"])
    ],
    targets: [
        .target(
            name: "SimpleFileLogger")

    ]
)
