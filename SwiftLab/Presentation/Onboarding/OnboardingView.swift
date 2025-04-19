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
                    Color.purple.opacity(0.7),
                    Color.blue.opacity(0.5),
                    Color.cyan.opacity(0.6),
                    Color.pink.opacity(0.5)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                // Logo Image
                Image("swiftlab_logo") // Replace with your asset name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .shadow(color: Color.pink.opacity(0.7), radius: 20)

                // Title
                Text("Welcome to")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Text("SwiftLab!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()

                // Subtitle
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)

                Spacer()

                // Get Started Button
                Button(action: {
                    // Handle onboarding completion
                }) {
                    Text("Get Started")
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
                        .cornerRadius(16)
                        .shadow(color: Color.purple.opacity(0.6), radius: 10)
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
            }
            .padding(.top, 80)
        }
    }
}


#Preview {
    OnboardingView()
}
