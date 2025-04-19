//
//  FrostedGlassTabBarView.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 19/04/2025.
//


import SwiftUI

struct FrostedGlassTabBarView: View {
    enum Tab { case projects, lab, about }

    @State private var selectedTab: Tab = .lab

    var body: some View {
        ZStack {
            // 🌈 Gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.purple.opacity(0.9),
                    Color.blue.opacity(0.7),
                    Color.cyan.opacity(0.6),
                    Color.pink.opacity(0.5)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            // 👇 App content view based on selected tab
            VStack {
                Spacer()
                contentView(for: selectedTab)
                Spacer().frame(height: 100) // reserve space for tab bar
            }

            // ⬆️ Frosted tab bar overlay
            VStack {
                Spacer()
                tabBar
            }
        }
    }

    // MARK: - Tab Bar UI
    var tabBar: some View {
        HStack(spacing: 60) {
            FrostedTabItem(icon: "folder.fill", label: "Projects", tab: .projects, selectedTab: $selectedTab)

            ZStack {
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.purple, Color.cyan]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 58, height: 58)
                    .shadow(color: Color.cyan.opacity(0.4), radius: 8)

                Image(systemName: "flask.fill")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
            }
            .offset(y: -20)
            .onTapGesture { selectedTab = .lab }

            FrostedTabItem(icon: "person.fill", label: "About", tab: .about, selectedTab: $selectedTab)
        }
        .frame(height: 60)
        .padding(.horizontal, 36)
        .background(
            RoundedRectangle(cornerRadius: 128, style: .continuous)
                .fill(Color.white.opacity(0.08))
                .background(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 128, style: .continuous)
                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.2), radius: 12)
        )
        .padding(.horizontal, 24)
        .padding(.bottom, 12)
    }

    // MARK: - Tab Content Views
    @ViewBuilder
    func contentView(for tab: Tab) -> some View {
        switch tab {
        case .projects:
            Text("📁 Projects View")
                .font(.title)
                .foregroundColor(.white.opacity(0.9))

        case .lab:
            Text("🧪 Lab View")
                .font(.title)
                .foregroundColor(.white.opacity(0.9))

        case .about:
            Text("👤 About View")
                .font(.title)
                .foregroundColor(.white.opacity(0.9))
        }
    }
}

#Preview {
    FrostedGlassTabBarView()
}
