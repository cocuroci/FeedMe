import Foundation
import ComposableArchitecture
import Dependencies

struct DetailRecipeFeature: Reducer {
    @Dependency(\.dismiss) var dismiss

    struct State: Equatable {
        let meal: Meal
    }

    enum Action: Equatable {
        case close
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .close:
            return .run { _ in await dismiss() } 
        }
    }
}
