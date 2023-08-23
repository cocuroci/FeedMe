import ComposableArchitecture
import Dependencies

struct RandomRecipeFeature: Reducer {
    @Dependency(\.randomRecipeClient) var randomRecipeClient

    struct State: Equatable {
        var isLoading = false
    }

    enum Action: Equatable {
        case fetchRandomFeed
        case randomFeedResponse
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .fetchRandomFeed:
            state.isLoading = true
            return .run { send in
                try await Task.sleep(for: .seconds(3))
                await send(.randomFeedResponse)
            }
        case .randomFeedResponse:
            state.isLoading = false
            return .none
        }
    }
}
