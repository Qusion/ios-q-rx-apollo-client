// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ios-q-rx-apollo-client",
    platforms: [.macOS(.v10_12),
                .iOS(.v11),
                .tvOS(.v10),
                .watchOS(.v3)],
    products: [
        .library(
            name: "ios-q-rx-apollo-client",
            targets: ["ios-q-rx-apollo-client"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apollographql/apollo-ios",
            .exact("0.29.1")
        ),
        .package(
            url: "https://github.com/ashleymills/Reachability.swift",
            .exact("5.0.0")
        ),
        .package(
            url: "https://github.com/ReactiveX/RxSwift",
            .exact("5.1.1")
        )
    ],
    targets: [
        .target(
            name: "ios-q-rx-apollo-client",
            dependencies: []),
        .testTarget(
            name: "ios-q-rx-apollo-clientTests",
            dependencies: ["ios-q-rx-apollo-client"]),
    ],
    swiftLanguageVersions: [.v5]
)
