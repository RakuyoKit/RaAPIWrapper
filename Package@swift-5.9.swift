// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "APIWrapper",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_14),
        .tvOS(.v12),
        .watchOS(.v5),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "APIWrapper", targets: ["APIWrapper"]),
        .library(name: "AFAPIWrapper", targets: ["AFAPIWrapper"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            .upToNextMajor(from: "5.9.0")),
    ],
    targets: [
        .target(
            name: "APIWrapper",
            path: "Sources/Core",
            resources: [.copy("PrivacyInfo.xcprivacy")]),
        .target(
            name: "AFAPIWrapper",
            dependencies: ["APIWrapper", "Alamofire"],
            path: "Sources/Alamofire"),
        .testTarget(
            name: "APIWrapperTests",
            dependencies: ["APIWrapper"]),
    ]
)

// Add the Swift formatting plugin if possible
package.dependencies.append(.package(url: "https://github.com/RakuyoKit/swift.git", from: "1.1.2"))
