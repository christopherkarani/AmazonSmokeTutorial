// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LevelUp",
    platforms: [
      .macOS(.v10_15)
    ],
    dependencies: [
      .package(url: "https://github.com/amzn/smoke-framework.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "LevelUp",
            dependencies: [
              .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework")
        ])],
    swiftLanguageVersions: [.v5]
)
