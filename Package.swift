// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "CocoAttributedStringBuilder",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "CocoAttributedStringBuilder",
            targets: ["CocoAttributedStringBuilder"]
        ),
    ],
    targets: [
        .target(
            name: "CocoAttributedStringBuilder",
            path: "CocoAttributedStringBuilder",
            exclude: [
                "Info.plist",
                "CocoAttributedStringBuilder.h"
            ]
        ),
        .testTarget(
            name: "CocoAttributedStringBuilderTests",
            dependencies: ["CocoAttributedStringBuilder"],
            path: "CocoAttributedStringBuilderTests"
        ),
    ]
)
