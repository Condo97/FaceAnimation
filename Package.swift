// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "FaceAnimation",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "FaceAnimation",
            targets: ["FaceAnimation"]),
    ],
    dependencies: [
        // Add your package dependencies here, if any.
    ],
    targets: [
        .target(
            name: "FaceAnimation",
            dependencies: []),
        .testTarget(
            name: "FaceAnimationTests",
            dependencies: ["FaceAnimation"]),
    ]
)
