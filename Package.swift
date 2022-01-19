// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KafkaRefresh",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "KafkaRefresh",
            targets: [
                "KafkaRefresh",
                "Category",
                "Configuration",
                "Core",
                "Default",
                "Style",
                "FootKit",
                "HeadKit",
                "LayerKit",
            ]
        ),
    ],
    dependencies: [
    ],
    targets: [
        // Umbrella
        .target(
            name: "KafkaRefresh",
            dependencies: [
                .target(name: "Category"),
                .target(name: "Configuration"),
                .target(name: "Core"),
                .target(name: "Default"),
                .target(name: "Style"),
                .target(name: "FootKit"),
                .target(name: "HeadKit"),
                .target(name: "LayerKit")
            ],
            path: "KafkaRefresh",
            sources: ["KafkaRefresh.m"],
            resources: [.process("Resource")],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "Category",
            dependencies: [],
            path: "KafkaRefresh/Category",
            exclude: ["Public"],
            publicHeadersPath: "Public",
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("QuartzCore")
            ]
        ),
        .target(
            name: "Configuration",
            dependencies: [
                .target(name: "HeadKit"),
                .target(name: "FootKit")
            ],
            path: "KafkaRefresh/Configuration",
            exclude: ["Public"],
            publicHeadersPath: "Public",
            linkerSettings: [
                .linkedFramework("UIKit")
            ]
        ),
        .target(
            name: "Core",
            dependencies: [
                .target(name: "Category")
            ],
            path: "KafkaRefresh/Core",
            exclude: ["Public"],
            publicHeadersPath: "Public",
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit")
            ]
        ),
        .target(
            name: "Default",
            dependencies: [
                .target(name: "Style")
            ],
            path: "KafkaRefresh/Default",
            exclude: ["Public"],
            publicHeadersPath: "Public",
            linkerSettings: [
                .linkedFramework("UIKit")
            ]
        ),
        .target(
            name: "Style",
            dependencies: [],
            path: "KafkaRefresh/Style",
            exclude: ["Public"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "HeadKit",
            dependencies: [
                .target(name: "LayerKit"),
                .target(name: "Category"),
                .target(name: "Core"),
                .target(name: "Default"),
                .target(name: "Style")
            ],
            path: "KafkaRefresh/UIKit/HeadKit",
            exclude: ["Public"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "FootKit",
            dependencies: [
                .target(name: "LayerKit"),
                .target(name: "Category"),
                .target(name: "Core"),
                .target(name: "Default"),
                .target(name: "Style")
            ],
            path: "KafkaRefresh/UIKit/FootKit",
            exclude: ["Public"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "LayerKit",
            dependencies: [
                .target(name: "Category"),
                .target(name: "Default")
            ],
            path: "KafkaRefresh/UIKit/LayerKit",
            exclude: ["Public"],
            publicHeadersPath: "Public",
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("QuartzCore")
            ]
        ),
        .testTarget(
            name: "KafkaRefreshTests",
            dependencies: ["KafkaRefresh"]
        )
    ]
)
