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

    var body: some View {
        ZStack {
            // Background gradient
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

            VStack {
                TabView(selection: Binding<Int>(
                    get: { viewModel.state.currentIndex },
                    set: { viewModel.handle(.navigateToPage(index: $0)) }
                )) {
                    ForEach(viewModel.state.pages.indices, id: \.self) { index in
                        OnboardingPageView(page: viewModel.state.pages[index])
                            .tag(index)
                            .padding(.top, 80)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

                Spacer()

                if viewModel.state.isLastPage {
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
                    .animation(.easeInOut(duration: 2.0), value: viewModel.state.isLastPage)
                }
            }
        }
        
    }
}

// MARK: - Page View Component
struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 24) {
            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
                .shadow(color: Color.pink.opacity(0.7), radius: 20)

            Text(page.title)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Text(page.subtitle)
                .font(.body)
                .foregroundColor(.white.opacity(0.85))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
    }
}

#Preview {
    TabbedOnboardingView()
}
