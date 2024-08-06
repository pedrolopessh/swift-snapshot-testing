// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "swift-snapshot-testing",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "SnapshotTesting",
      targets: ["SnapshotTesting"]
    ),
    .library(
      name: "InlineSnapshotTesting",
      targets: ["InlineSnapshotTesting"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/sjavora/swift-syntax-xcframeworks.git", exact: "510.0.1")
  ],
  targets: [
    .target(
      name: "SnapshotTesting"
    ),
    .target(
      name: "InlineSnapshotTesting",
      dependencies: [
        "SnapshotTesting",
//        .product(name: "SwiftParser", package: "swift-syntax"),
//        .product(name: "SwiftSyntax", package: "swift-syntax"),
//        .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
			.product(name: "SwiftSyntaxWrapper", package: "swift-syntax-xcframeworks"),
      ]
    ),
    .testTarget(
      name: "InlineSnapshotTestingTests",
      dependencies: [
        "InlineSnapshotTesting"
      ]
    ),
    .testTarget(
      name: "SnapshotTestingTests",
      dependencies: [
        "SnapshotTesting"
      ],
      exclude: [
        "__Fixtures__",
        "__Snapshots__",
      ]
    ),
  ]
)
