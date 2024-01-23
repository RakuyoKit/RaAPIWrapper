// swift-tools-version: 5.1

import PackageDescription

let package = Package(
    name: "APIWrapper",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "APIWrapper", targets: ["APIWrapper"]),
        .library(name: "AFAPIWrapper", targets: ["AFAPIWrapper"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .target(
            name: "APIWrapper",
            path: "Sources/Core"),
        .target(
            name: "AFAPIWrapper",
            dependencies: ["APIWrapper", "Alamofire"],
            path: "Sources/Alamofire"),
        .testTarget(
            name: "APIWrapperTests",
            dependencies: ["APIWrapper"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)
