//
//  View+Neon.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

// For a more animated neon effect, you can add this modifier
extension View {
    func neonPulse(color: Color, intensity: Double = 1.0, speed: Double = 1.0) -> some View {
        self.modifier(NeonPulseModifier(color: color, intensity: intensity, speed: speed))
    }

    // Combined neon and floating effect
    func neonFloating(color: Color, glowIntensity: Double = 1.0, floatHeight: Double = 10, speed: Double = 1.0) -> some View {
        self
            .neonPulse(color: color, intensity: glowIntensity, speed: speed)
            .floating(height: floatHeight, speed: speed)
    }
}

struct NeonPulseModifier: ViewModifier {
    let color: Color
    let intensity: Double
    let speed: Double

    @State private var isPulsing = false

    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(isPulsing ? 0.7 * intensity : 0.3 * intensity), radius: isPulsing ? 15 : 5)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.5 / speed).repeatForever(autoreverses: true)) {
                    self.isPulsing = true
                }
            }
    }
}
