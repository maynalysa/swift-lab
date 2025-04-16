//
//  View+Floating.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

extension View {
    func floating(height: Double = 10, speed: Double = 1.0) -> some View {
        self.modifier(FloatingModifier(height: height, speed: speed))
    }
}

struct FloatingModifier: ViewModifier {
    let height: Double
    let speed: Double

    @State private var isFloating = false

    func body(content: Content) -> some View {
        content
            .offset(y: isFloating ? -height : 0)
            .onAppear {
                withAnimation(
                    Animation
                        .easeInOut(duration: 2.0 / speed)
                        .repeatForever(autoreverses: true)
                ) {
                    self.isFloating = true
                }
            }
    }
}
