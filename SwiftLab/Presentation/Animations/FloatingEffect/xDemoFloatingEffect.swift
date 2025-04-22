//
//  xDemoFloatingEffect.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

// Example view with image with floating animation
struct DemoFloatingEffectView: View {
    var body: some View {
        Image(systemName: "star.fill")
            .floating(height: 15, speed: 5)
            .foregroundColor(.red)
    }
}

#Preview {
    DemoFloatingEffectView()
}
