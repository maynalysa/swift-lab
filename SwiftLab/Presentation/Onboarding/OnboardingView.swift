//
//  OnboardingView.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 19/04/2025.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.purple.opacity(.Opacity.almostTranslucent),
                    Color.blue.opacity(.Opacity.nearlyOpaque),
                    Color.cyan.opacity(.Opacity.semiOpaque),
                    Color.pink.opacity(.Opacity.almostTranslucent)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: .Space.l + .Space.m) {
                // Logo Image
                Image(asset: Asset.onboardingSwiftLab)
                    .resizable()
                    .scaledToFit()
                    .frame(width: .Size.large, height: .Size.large)
                    .shadow(color: Color.pink.opacity(.Opacity.nearlyOpaque), radius: .CornerRadius.pill)
                    .floating()
                    .neonPulse(color: .pink, intensity: 0.8)

                // Title
                Text(Lang.onboardingWelcomeTitle)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Text(Lang.onboardingSwiftlabSubtitle)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()

                // Subtitle
                Text(Lang.onboardingLorem)
                    .font(.body)
                    .foregroundColor(.white.opacity(.Opacity.nearlyOpaque))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, .Space.l + .Space.m)

                Spacer()

                // Get Started Button
                Button(action: {
                    // Handle onboarding completion
                }) {
                    Text(Lang.onboardingGetStartedButton)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.purple, Color.blue]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(.CornerRadius.softRound)
                        .shadow(color: Color.purple.opacity(.Opacity.semiOpaque), radius: .CornerRadius.softRound)
                }
                .padding(.horizontal, .Space.l + .Space.m)
                .padding(.bottom, .Space.xl + .Space.m)
            }
            .padding(.top, .Space.xxl + .Space.m)
        }
    }
}


#Preview {
    OnboardingView()
}
