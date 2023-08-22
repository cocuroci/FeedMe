import SwiftUI
import ComposableArchitecture

struct RandomRecipeView: View {
    let store: StoreOf<RandomRecipeFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("Vamos comer algo diferente?")
                    .font(.headline)
                Button("Quero uma receita aleatória") {
                    viewStore.send(.fetchRandomFeed)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RandomRecipeView(store: Store(
                initialState: RandomRecipeFeature.State()) { RandomRecipeFeature()
                })
    }
}
