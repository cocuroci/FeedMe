import Dependencies

struct RandomRecipeClient {
    var fetch: () async throws -> Void
}

extension RandomRecipeClient: DependencyKey {
    static var liveValue: RandomRecipeClient {
        RandomRecipeClient {

        }
    }
}

extension DependencyValues {
    var randomRecipeClient: RandomRecipeClient {
        get { self[RandomRecipeClient.self] }
        set { self[RandomRecipeClient.self] = newValue }
    }
}
