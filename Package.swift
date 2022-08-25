// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RaAPIWrapper",
    platforms: [.iOS(.v10)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RaAPIWrapper",
            targets: ["RaAPIWrapper"]),
    ],
    dependencies: [
        .package(
            url: "git@git.iqlcd.com:mobile/ios/resources/components/github/Alamofire.git",
            from: "5.6.2"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RaAPIWrapper",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "RaAPIWrapperTests",
            dependencies: ["RaAPIWrapper"]),
    ],
    swiftLanguageVersions: [.v5]
)
