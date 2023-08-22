import SwiftUI
import ComposableArchitecture

@main
struct FeedMeApp: App {
    static let store = Store(initialState: RandomRecipeFeature.State()) {
        RandomRecipeFeature()
            ._printChanges()
    }

    var body: some Scene {
        WindowGroup {
            RandomRecipeView(store: Self.store)
        }
    }
}
