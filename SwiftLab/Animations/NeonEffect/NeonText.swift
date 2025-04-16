//
//  NeonText.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

// Neon Text Component
struct NeonText: View {
    let text: String
    let color: Color
    let fontSize: Double
    let fontWeight: Font.Weight
    let glowRadius: Double
    let glowIntensity: Int

    init(
        text: String,
        color: Color = .white,
        fontSize: Double = 36,
        fontWeight: Font.Weight = .bold,
        glowRadius: Double = 5,
        glowIntensity: Int = 5
    ) {
        self.text = text
        self.color = color
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.glowRadius = glowRadius
        self.glowIntensity = glowIntensity
    }

    var body: some View {
        ZStack {
            // Multiple glow layers for neon effect
            ForEach(0..<glowIntensity, id: \.self) { intensity in
                Text(text)
                    .font(.system(size: fontSize, weight: fontWeight))
                    .foregroundColor(color)
                    .blur(radius: glowRadius * Double(intensity) / Double(glowIntensity))
                    .opacity(1.0 / Double(glowIntensity))
            }

            // Main text layer
            Text(text)
                .font(.system(size: fontSize, weight: fontWeight))
                .foregroundColor(.white)
        }
    }
}
