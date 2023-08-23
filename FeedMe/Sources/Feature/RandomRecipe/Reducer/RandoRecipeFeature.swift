import ComposableArchitecture
import Dependencies

struct RandomRecipeFeature: Reducer {
    @Dependency(\.randomRecipeClient) var randomRecipeClient

    struct State: Equatable {
        @PresentationState var detailState: DetailRecipeFeature.State?
        var isLoading = false
        var result: RandomRecipeResult? = nil
        var messageError: String = ""
    }

    enum Action: Equatable {
        case fetchRandomFeed
        case randomFeedResponse(RandomRecipeResult)
        case fetchRandomError
        case detailState(PresentationAction<DetailRecipeFeature.Action>)
    }

    var body: some ReducerOf<Self> {
        Reduce(self.core)
            .ifLet(\.$detailState, action: /Action.detailState) {
                DetailRecipeFeature()
            }
    }

    func core(into state: inout State, action: Action) -> Effect<Action> {
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

            guard let meal = result.meals.first else {
                return .none
            }

            state.detailState = .init(meal: meal)
            return .none
        case .fetchRandomError:
            state.isLoading = false
            state.result = nil
            state.messageError = "Erro ao carregar uma receita"
            return .none

        case .detailState:
            return .none
        }
    }
}
