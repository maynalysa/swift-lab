//
//  SwiftUIExamplesView.swift
//  SwiftUIExamples
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

struct SwiftUIExamplesView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Welcome To SwiftUI examples")
                Text("👇🏾 👇🏾👇🏾")
                
                
                // DEMOS
                Text("Animations & Components")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                VStack(alignment: .center, spacing: .Space.m) {
                    CardView(
                        title: "Floating Effect"
                    ) {
                        DemoFloatingEffectView()
                            .frame(width:  250, height: 250)
                    }

                    CardView(
                        title: "Neon Effect"
                    ) {
                        DemoNeonEffectView()
                            .frame(width:  250, height: 250)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SwiftUIExamplesView()
}
