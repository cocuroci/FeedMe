import Foundation
import Dependencies

struct RandomRecipeClient {
    var fetch: () async throws -> RandomRecipeResult
}

extension RandomRecipeClient: DependencyKey {
    static var liveValue: RandomRecipeClient {
        RandomRecipeClient {
            let (data, _) = try await URLSession.shared.data(
                from: URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!
            )

            return try JSONDecoder().decode(RandomRecipeResult.self, from: data)
        }
    }
}

extension RandomRecipeClient: TestDependencyKey {
    static var testValue: RandomRecipeClient {
        RandomRecipeClient {
            .init(meals: [.mock])
        }
    }
}

extension DependencyValues {
    var randomRecipeClient: RandomRecipeClient {
        get { self[RandomRecipeClient.self] }
        set { self[RandomRecipeClient.self] = newValue }
    }
}
