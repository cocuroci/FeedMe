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
                .disabled(viewStore.isLoading)
                .buttonStyle(.borderedProminent)

                if !viewStore.messageError.isEmpty {
                    Text(viewStore.messageError)
                        .font(.caption)
                        .foregroundColor(.red)
                }

            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .overlay {
                if viewStore.isLoading {
                    ZStack {
                        Color.white
                            .opacity(0.7)
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .cornerRadius(25)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                }
            }
            .ignoresSafeArea(edges: .all)
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
