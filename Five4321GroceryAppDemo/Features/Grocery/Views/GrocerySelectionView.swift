//
//  ContentView.swift
//  Five4321GroceryAppDemo
//
//  Created by Alexis Roberson on 11/3/25.
//

import SwiftUI

struct GrocerySelectionView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .navigationTitle("Grocery")
        }
    }
}

#Preview {
    GrocerySelectionView()
}
