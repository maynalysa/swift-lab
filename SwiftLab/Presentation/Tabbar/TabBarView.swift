//
//  TabBarView.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 19/04/2025.
//

import SwiftUI

struct SwiftLabTabBarView: View {
    @State private var selectedTab: Tab = .lab

    enum Tab {
        case projects, lab, about
    }

    var body: some View {
        VStack {
            Spacer()

            ZStack {
                // Custom Tab Bar Background
                // Tab bar background with deep blue & neon glow
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(red: 20/255, green: 20/255, blue: 50/255)) // deep indigo/navy base
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.cyan.opacity(0.6), lineWidth: 1.5)
                    )
                    .shadow(color: Color.cyan.opacity(0.3), radius: 8, x: 0, y: 0)
                    .frame(height: 80)
                    .padding(.horizontal, 24)
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(
//                        LinearGradient(
//                            gradient: Gradient(colors: [
//                                Color.white.opacity(0.1),
//                                Color.gray.opacity(0.1)
//                            ]),
//                            startPoint: .topLeading,
//                            endPoint: .bottomTrailing
//                        )
//                    )
//                    .background(.ultraThinMaterial)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 25)
//                            .stroke(Color.cyan.opacity(0.4), lineWidth: 1)
//                    )
//                    .frame(height: 80)
//                    .padding(.horizontal, 24)
//                    .shadow(color: Color.black.opacity(0.1), radius: 10)

                HStack(spacing: 48) {
                    TabBarItem(icon: "folder.fill", label: "Projects", tab: .projects, selectedTab: $selectedTab)

                    // Center glowing Lab button
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.purple, Color.cyan]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 64, height: 64)
                            .shadow(color: Color.cyan.opacity(0.6), radius: 12)

                        Image(systemName: "flask.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .shadow(color: Color.cyan.opacity(0.5), radius: 10)
//                        Image(systemName: "flask.fill")
//                            .font(.system(size: 24))
//                            .foregroundColor(.white)
                    }
                    .offset(y: -28)
                    .onTapGesture {
                        selectedTab = .lab
                    }
                    .scaleEffect(selectedTab == .lab ? 1.1 : 1.0)
                    .animation(.easeInOut(duration: 0.3), value: selectedTab)

                    TabBarItem(icon: "person.crop.circle.fill", label: "About", tab: .about, selectedTab: $selectedTab)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    SwiftLabTabBarView()
}
