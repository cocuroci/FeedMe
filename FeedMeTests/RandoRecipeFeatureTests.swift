//
//  FeedMeTests.swift
//  FeedMeTests
//
//  Created by Andre on 22/08/23.
//

import XCTest
import Dependencies
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

        await store.receive(.randomFeedResponse(.init(meals: [.init(id: "1")]))) {
            $0.isLoading = false
            $0.result = .init(meals: [.init(id: "1")])
        }
    }

    func testFetchRandomFeedError() async {
        let store = TestStore(initialState: RandomRecipeFeature.State()) {
            RandomRecipeFeature()
        } withDependencies: { context in
            context.randomRecipeClient = .init {
                throw NSError(domain: "br.com.andrecocuroci.Error", code: 1)
            }
        }

        await store.send(.fetchRandomFeed) {
            $0.isLoading = true
        }

        await store.receive(.fetchRandomError) {
            $0.isLoading = false
            $0.messageError = "Erro ao carregar uma receita"
        }
    }
}
