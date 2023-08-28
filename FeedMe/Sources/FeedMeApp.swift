import SwiftUI
import ComposableArchitecture
import XCTestDynamicOverlay

@main
struct FeedMeApp: App {
    static let store = Store(initialState: RandomRecipeFeature.State()) {
        RandomRecipeFeature()
            ._printChanges()
    }

    var body: some Scene {
        WindowGroup {
            if !_XCTIsTesting {
                RandomRecipeView(store: Self.store)
            }
        }
    }
}
