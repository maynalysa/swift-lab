//
//  SplashScreen.swift
//  SwiftUIExemples
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI


// MARK: - ⚠️❌⚠️❌⚠️❌⚠️❌⚠️❌ ONGOING CHANGES ⚠️❌⚠️❌⚠️❌⚠️❌⚠️❌

struct SplashScreen: View {
    // Optional state for animation or transition timing
    @State private var isActive = false

    var body: some View {
        ZStack {
            // Black background covering the entire screen
            Color.black
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                // Center image - using a custom icon or system image
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)

                // App name text
                Text("")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
        }
    }
}

// Alternative version with animation for actual use
struct AnimatedSplashScreen: View {
    @State private var isActive = false
    @State private var iconScale = 0.8
    @State private var iconOpacity: Double = 0
    @State private var textOpacity: Double = 0

    var body: some View {
        ZStack {
            // Black background
            Color.black
                .edgesIgnoringSafeArea(.all)

            // Splash screen content
            VStack(spacing: 30) {
                // Center image with animation
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .scaleEffect(iconScale)
                    .opacity(iconOpacity)

                // App name text with animation
                Text("")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .opacity(textOpacity)
            }
            .onAppear {
                // Animate icon
                withAnimation(.easeInOut(duration: 1.2)) {
                    self.iconScale = 1.0
                    self.iconOpacity = 1.0
                }

                // Animate text with delay
                withAnimation(.easeInOut(duration: 1.0).delay(0.4)) {
                    self.textOpacity = 1.0
                }

                // Navigate to main screen after delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

// Preview both versions
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SplashScreen()
                .previewDisplayName("Simple Splash")

            AnimatedSplashScreen()
                .previewDisplayName("Animated Splash")
        }
    }
}
