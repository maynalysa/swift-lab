//
//  xDemoNeonEffect.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

struct DemoNeonEffectView: View {
    var body: some View {
        NeonImageView(
            image: Image(systemName: "star.fill"),
            glowColor: .yellow,
            glowRadius: 15,
            glowIntensity: 5
        )
        .neonPulse(color: .yellow, intensity: 1.2, speed: 2)
        .frame(width: 150, height: 150)
    }
}

#Preview {
    DemoNeonEffectView()
}
