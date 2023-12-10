//
//  ContentView.swift
//  SwiftUISnippets
//
//  Created by Morris Richman on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    InfiniteTabView()
                } label: {
                    HStack {
                        Image(systemName: "square.stack")
                        Text("Infinite TabView")
                    }
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
