//
//  TabbedOnboardingViewModel.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 20/04/2025.
//

import SwiftUI

// MARK: - Model
struct OnboardingPage {
    let title: String
    let subtitle: String
    let imageName: String
}

// MARK: - ViewState
struct OnboardingViewState {
    var pages: [OnboardingPage] = []
    var currentIndex: Int = 0
    var isLastPage: Bool { currentIndex == pages.count - 1 }
    
    enum ViewAction {
        case navigateToPage(index: Int)
        case completeOnboarding
    }
}

// MARK: - ViewModel
class OnboardingViewModel: ObservableObject {
    @Published private(set) var state: OnboardingViewState
    
    init() {
        let pages = [
            OnboardingPage(title: "Welcome to SwiftLab!", subtitle: "Build and launch Swift apps with blazing speed.", imageName: "swiftlab_logo"),
            OnboardingPage(title: "Experiment Freely", subtitle: "Your dev lab for prototyping, learning, and growing.", imageName: "swiftlab_logo"),
            OnboardingPage(title: "Join the Future", subtitle: "Transform your ideas into powerful Swift experiences.", imageName: "swiftlab_logo")
        ]
        
        self.state = OnboardingViewState(pages: pages)
    }
    
    func handle(_ action: OnboardingViewState.ViewAction) {
        switch action {
        case .navigateToPage(let index):
            state.currentIndex = index
        case .completeOnboarding:
            // Handle onboarding completion logic
            // For example, set a UserDefaults flag and dismiss the view
            UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
            // You might also want to notify some other part of your app
            // or use a completion handler passed in through the initializer
        }
    }
}
