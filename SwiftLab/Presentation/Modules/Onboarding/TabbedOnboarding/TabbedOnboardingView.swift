//
//  TabbedOnboardingView.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 19/04/2025.
//

import SwiftUI

// MARK: - View
struct TabbedOnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var animateButton = false
    @State private var hueRotation = false
    @State private var shimmerOffset = -0.5

    var body: some View {
        ZStack {
            gradientBackground

            VStack {
                onboardingTabbedView

                ZStack {
                    if viewModel.state.isLastPage {
                        getStartedButton
                    }
                }
                .frame(height: 30)
                .padding(.bottom, 10)
            }
        }
    }

    private var gradientBackground: some View {
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
    }

    private var onboardingTabbedView: some View {
        TabView(selection: Binding<Int>(
            get: { viewModel.state.currentIndex },
            set: { viewModel.handle(.navigateToPage(index: $0)) }
        )) {
            ForEach(viewModel.state.pages.indices, id: \.self) { index in
                OnboardingPageView(page: viewModel.state.pages[index])
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }

    private var getStartedButton: some View {
        Button(action: {
            viewModel.handle(.completeOnboarding)
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
                .cornerRadius(16)
                .shadow(color: Color.purple.opacity(0.6), radius: 10)
        }
        .padding(.horizontal, 32)
        .scaleEffect(animateButton ? 1.0 : 0.7)
        .opacity(animateButton ? 1.0 : 0)
        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: animateButton)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                animateButton = true
            }
        }
        .onDisappear {
            animateButton = false
        }
    }

    private var getStartedHueButton: some View {
        Button(action: {
                 viewModel.handle(.completeOnboarding)
        }) {
            Text("Get Started")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.purple,
                            Color.blue,
                            Color.cyan,
                            Color.purple
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .hueRotation(.degrees(hueRotation ? 30 : 0))
                .animation(
                    Animation.easeInOut(duration: 3)
                        .repeatForever(autoreverses: true),
                    value: hueRotation
                )
                .cornerRadius(16)
                .shadow(color: Color.purple.opacity(0.6), radius: 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.5),
                                    Color.clear,
                                    Color.white.opacity(0.2),
                                    Color.clear
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.5
                        )
                )
                .padding(.horizontal, 32)
                .scaleEffect(animateButton ? 1.0 : 0.7)
                .opacity(animateButton ? 1.0 : 0)
                .animation(.spring(response: 0.4, dampingFraction: 0.7), value: animateButton)
                .onAppear {
                    // Small delay to ensure smooth animation when tab changes
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        animateButton = true
                    }

                    // Start the iridescent animation with a small delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        hueRotation = true
                    }
                }
                .onDisappear {
                    animateButton = false
                    hueRotation = false
                }
        }
    }
}

// MARK: - Page View Component
struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: .Space.xxl) {
            Text(page.title)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Image(asset: page.image)
                .resizable()
                .scaledToFit()
                .frame(width: .Size.large, height: .Size.large)
                .shadow(color: Color.cyan.opacity(0.7), radius: 20)

            Text(page.subtitle)
                .font(.body)
                .foregroundColor(.white.opacity(0.85))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer()
        }
        .padding(.top, .Space.xxl)
    }
}

#Preview {
    TabbedOnboardingView()
}
