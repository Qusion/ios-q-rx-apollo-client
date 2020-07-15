// swift-tools-version:5.2

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
