//
//  FeedMeTests.swift
//  FeedMeTests
//
//  Created by Andre on 22/08/23.
//

import XCTest
import ComposableArchitecture

@testable import FeedMe

@MainActor
final class RandoRecipeFeatureTests: XCTestCase {
    func testFetchRandomFeed() async {
        let store = TestStore(initialState: RandomRecipeFeature.State()) {
            RandomRecipeFeature()
        }

        await store.send(.fetchRandomFeed) {
            $0.isLoading = true
        }

        await store.receive(.randomFeedResponse, timeout: .seconds(3)) {
            $0.isLoading = false
        }
    }
}
