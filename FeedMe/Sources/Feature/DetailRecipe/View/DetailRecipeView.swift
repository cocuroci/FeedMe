//
//  DetailRecipeView.swift
//  FeedMe
//
//  Created by Andre on 23/08/23.
//  Copyright © 2023 Cocuroci. All rights reserved.
//

import SwiftUI

struct DetailRecipeView: View {
    var body: some View {
        NavigationStack {
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
                    Button("Fechar", action: {})
                }
            }
        }
    }
}

struct DetailRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecipeView()
    }
}
