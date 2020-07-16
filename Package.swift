// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QRxApolloClient",
    platforms: [.macOS(.v10_12),
                .iOS(.v11),
                .tvOS(.v10),
                .watchOS(.v3)],
    products: [
        .library(
            name: "QRxApolloClient",
            targets: ["QRxApolloClient"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apollographql/apollo-ios",
            .upToNextMinor(from: "0.19.1")),
        .package(
            url: "https://github.com/ashleymills/Reachability.swift",
            .upToNextMinor(from: "5.0.0")),
        .package(
            url: "https://github.com/ReactiveX/RxSwift",
            .upToNextMinor(from: "5.1.1")),
    ],
    targets: [
        .target(name: "QRxApolloClient", path: "QRxApolloClient")
    ],
    swiftLanguageVersions: [.v5]
)
