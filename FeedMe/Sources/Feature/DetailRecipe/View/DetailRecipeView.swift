import SwiftUI
import ComposableArchitecture

struct DetailRecipeView: View {
    let store: StoreOf<DetailRecipeFeature>

    var body: some View {
        NavigationStack {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                ScrollView {
                    VStack {
                        Text(viewStore.meal.meal)
                            .font(.title)

                        AsyncImage(url: URL(string: viewStore.meal.thumb)) { image in
                            image.resizable()
                        } placeholder: {
                            ZStack {
                                Color.gray.opacity(0.4)
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                            }
                        }
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .overlay(alignment: .bottomTrailing) {
                                if let url = viewStore.meal.youtubeUrl {
                                    Link("Ver no youtube", destination: url)
                                        .font(.footnote)
                                        .padding(4)
                                        .buttonStyle(.borderedProminent)
                                }
                            }

                        Text(viewStore.meal.instructions)
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }.padding()
                }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Fechar", action: {
                            viewStore.send(.close)
                        })
                    }
                }
            }
        }
    }
}

struct DetailRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecipeView(
            store: .init(initialState: DetailRecipeFeature.State(meal: .mock)) {
            DetailRecipeFeature()
        })
    }
}
