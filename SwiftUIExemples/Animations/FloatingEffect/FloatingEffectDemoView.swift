//
//  FloatingEffectDemoView.swift
//  SwiftUIExamples
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

// Example with animation
struct FloatingEffectDemoView: View {
    var body: some View {
        Image(systemName: "star.fill")
            .floating(height: 15, speed: 0.9)
    }
}


#Preview {
    FloatingEffectDemoView()
}

