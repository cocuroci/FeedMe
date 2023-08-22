import ProjectDescription

let project = Project(
    name: "FeedMe",
    organizationName: "Cocuroci",
    targets: [
        .init(
            name: "FeedMe",
            platform: .iOS,
            product: .app,
            bundleId: "br.com.andrecocuroci.FeedMe",
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchScreen": [
                    "UILaunchScreen": [:]
                ],
                "UIApplicationSceneManifest": [
                    "UIApplicationSupportsMultipleScenes": true
                ]
            ]),
            sources: ["FeedMe/Sources/**"],
            resources: ["FeedMe/Resources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture")
            ]
        ),
        .init(
            name: "FeedMeTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "br.com.andrecocuroci.FeedMe.tests",
            infoPlist: .default,
            sources: ["FeedMeTests/**"],
            dependencies: [.target(name: "FeedMe")]
        )
    ]
)
