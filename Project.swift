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
            sources: ["FeedMe/**"]
        ),
        .init(
            name: "FeedMeTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "br.com.andrecocuroci.FeedMe.tests",
            sources: ["FeedMeTests/**"]
        )
    ]
)
