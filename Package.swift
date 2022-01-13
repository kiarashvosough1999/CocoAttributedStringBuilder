// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CocoAttributedStringBuilder",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v5),
        .macOS(.v10_10)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CocoAttributedStringBuilder",
            targets: ["CocoAttributedStringBuilder"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CocoAttributedStringBuilder",
            path: "Sources",
            exclude: ["Info.plist"],
            linkerSettings: [
                .linkedFramework("UIKit",
                                 .when(platforms: [
                                    .iOS,
                                    .watchOS,
                                 ])),
                .linkedFramework("AppKit",
                                 .when(platforms: [
                                    .macOS
                                 ])),
                .linkedFramework("CoreGraphics",
                               .when(platforms: [
                                .iOS,
                                .macOS,
                                .tvOS,
                                .watchOS
                               ])),
                .linkedFramework("Foundation",
                               .when(platforms: [
                                .iOS,
                                .macOS,
                                .tvOS,
                                .watchOS
                               ]))
            ]),
        .testTarget(
            name: "CocoAttributedStringBuilderTests",
            dependencies: ["CocoAttributedStringBuilder"],
            path: "Tests",
            exclude: ["Info.plist"]),
    ]
)
