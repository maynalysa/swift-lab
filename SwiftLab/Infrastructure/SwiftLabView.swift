//
//  SwiftLabView.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

struct SwiftLabView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("")
                Text("")

                // DEMOS
                Text("")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                VStack(spacing: .Space.m) {
                    CardView(
                        title: ""
                    ) {
                        DemoFloatingEffectView()
                            .frame(width: 300, height: 200)
                    }

                    CardView(
                        title: ""
                    ) {
                        DemoNeonEffectView()
                            .frame(width: 300, height: 250)
                    }

                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    SwiftLabView()
}
