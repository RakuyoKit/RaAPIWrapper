// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "APIWrapper",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "APIWrapper",
            targets: ["APIWrapper"]),
    ],
    dependencies: [
        .package(
            url: "git@git.iqlcd.com:mobile/ios/resources/components/github/Alamofire.git",
            from: "5.6.2"
        ),
    ],
    targets: [
        .target(
            name: "APIWrapper",
            dependencies: ["Alamofire"],
            path: "Sources"),
        .testTarget(
            name: "APIWrapperTests",
            dependencies: ["APIWrapper"],
            path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)
