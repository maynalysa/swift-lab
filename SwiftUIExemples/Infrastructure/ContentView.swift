//
//  ContentView.swift
//  SwiftUIExemples
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, Welcome!")
                Text("👇🏾 Exemples 👇🏾")
                
                
                // DEMOS
                VStack(alignment: .center, spacing: .Space.m) {
                    CardView(title: "Floating Effect") {
                        FloatingEffectDemoView()
                    }
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
