//
//  HomeView.swift
//  FeedMe
//
//  Created by Andre on 22/08/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Vamos comer algo diferente?")
                .font(.headline)
            Button("Quero uma receita aleatória") {

            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
