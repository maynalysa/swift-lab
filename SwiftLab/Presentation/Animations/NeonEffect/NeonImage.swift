//
//  NeonImage.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

struct NeonImageView: View {
    let image: Image
    let glowColor: Color
    let glowRadius: Double
    let glowIntensity: Int

    init(
        image: Image,
        glowColor: Color = .pink,
        glowRadius: Double = 10,
        glowIntensity: Int = 5
    ) {
        self.image = image
        self.glowColor = glowColor
        self.glowRadius = glowRadius
        self.glowIntensity = glowIntensity
    }

    var body: some View {
        ZStack {
            // Multiple layers of the same image with increasing blur to create neon effect
            ForEach(0..<glowIntensity, id: \.self) { intensity in
                image
                    .resizable()
                    .scaledToFit()
                    .blur(radius: glowRadius * Double(intensity) / Double(glowIntensity))
                    .opacity(1.0 / Double(glowIntensity))
            }

            // Original sharp image on top
            image
                .resizable()
                .scaledToFit()
        }
        .foregroundColor(glowColor)
    }
}
