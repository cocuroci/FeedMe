import ComposableArchitecture

struct RandomRecipeFeature: Reducer {
    struct State: Equatable {}

    enum Action: Equatable {
        case fetchRandomFeed
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .fetchRandomFeed:
            return .none
        }
    }
}
