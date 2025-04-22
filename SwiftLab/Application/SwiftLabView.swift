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
                Image(asset: Asset.swiftLab)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)

                Text(L10n.swiftLab)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(L10n.animations)
                    .font(.headline)
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
