//
//  TabbedOnboardingView.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 19/04/2025.
//

import SwiftUI

struct OnboardingPage {
    let title: String
    let subtitle: String
    let imageName: String
}

struct TabbedOnboardingView: View {
    let pages: [OnboardingPage] = [
        OnboardingPage(title: "Welcome to SwiftLab!", subtitle: "Build and launch Swift apps with blazing speed.", imageName: "swiftlab_logo"),
        OnboardingPage(title: "Experiment Freely", subtitle: "Your dev lab for prototyping, learning, and growing.", imageName: "swiftlab_logo"),
        OnboardingPage(title: "Join the Future", subtitle: "Transform your ideas into powerful Swift experiences.", imageName: "swiftlab_logo")
    ]

    @State private var currentIndex = 0

    var body: some View {
        ZStack {
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
                TabView(selection: $currentIndex) {
                    ForEach(pages.indices, id: \.self) { index in
                        VStack(spacing: 24) {
                            Image(pages[index].imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 160, height: 160)
                                .shadow(color: Color.pink.opacity(0.7), radius: 20)

                            Text(pages[index].title)
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)

                            Text(pages[index].subtitle)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.85))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                        }
                        .tag(index)
                        .padding(.top, 80)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

                Spacer()

                if currentIndex == pages.count - 1 {
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
            }
        }
    }
}

#Preview {
    TabbedOnboardingView()
}
