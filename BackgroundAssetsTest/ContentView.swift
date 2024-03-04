//
//  ContentView.swift
//  BackgroundAssetsTest
//  
//  Created by Keisuke Chinone on 2024/02/27.
//


import SwiftUI

struct ContentView: View {
    @State private var assetsManager = AssetsManager()
    
    var body: some View {
        NavigationStack {
                ScrollView {
                    Text(assetsManager.text)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                }
            .navigationTitle("JSON")
            .toolbar(id: "Content") {
                ToolbarItem(id: "trash",placement: .primaryAction) {
                    Button(action: {
                        assetsManager.delete()
                    }) {
                        Image(systemName: "trash")
                    }
                }
                
                ToolbarItem(id: "arrow.counterclockwise",placement: .primaryAction) {
                    Button(action: {
                        assetsManager.loadAssets()
                    }){
                        Image(systemName: "arrow.counterclockwise")
                    }
                }
            }
        }
        #if os(macOS) || os(visionOS)
        .frame(minWidth: 600, minHeight: 400)
        #endif
    }
}

#Preview {
    ContentView()
}
