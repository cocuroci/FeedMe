import ComposableArchitecture
import Dependencies

struct RandomRecipeFeature: Reducer {
    @Dependency(\.randomRecipeClient) var randomRecipeClient

    struct State: Equatable {
        var isLoading = false
        var result: RandomRecipeResult? = nil
        var messageError: String = ""
    }

    enum Action: Equatable {
        case fetchRandomFeed
        case randomFeedResponse(RandomRecipeResult)
        case fetchRandomError
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .fetchRandomFeed:
            state.isLoading = true
            return .run { send in
                let result = try await randomRecipeClient.fetch()
                await send(.randomFeedResponse(result))
            } catch: { error, send in
                await send(.fetchRandomError)
            }
        case let .randomFeedResponse(result):
            state.isLoading = false
            state.result = result
            return .none
        case .fetchRandomError:
            state.isLoading = false
            state.result = nil
            state.messageError = "Erro ao carregar uma receita"
            return .none
        }
    }
}
