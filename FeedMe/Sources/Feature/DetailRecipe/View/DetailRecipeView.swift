import SwiftUI
import ComposableArchitecture

struct DetailRecipeView: View {
    let store: StoreOf<DetailRecipeFeature>

    var body: some View {
        NavigationStack {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                ScrollView {
                    VStack {
                        Text("Title")
                            .font(.title)

                        AsyncImage(url: URL(string: "")) { image in
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

                        Text("Description")
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
            store: .init(initialState: DetailRecipeFeature.State(meal: .init(id: "1"))) {
            DetailRecipeFeature()
        })
    }
}
