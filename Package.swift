// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SheetUI",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v15)
    ],
    products: [
        .library(name: "SheetUI", targets: ["SheetUI"]),
    ],
    targets: [
        .target(name: "SheetUI"),
    ]
)
