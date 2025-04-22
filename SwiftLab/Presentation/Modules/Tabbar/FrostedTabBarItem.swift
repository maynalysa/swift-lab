//
//  FrostedTabBarItem.swift.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 19/04/2025.
//

import SwiftUI

// MARK: - ⚠️❌⚠️❌⚠️❌⚠️❌⚠️❌ ONGOING CHANGES ⚠️❌⚠️❌⚠️❌⚠️❌⚠️❌
struct FrostedTabItem: View {
    let icon: String
    let label: String
    let tab: FrostedGlassTabBarView.Tab
    @Binding var selectedTab: FrostedGlassTabBarView.Tab

    var body: some View {
        Button(action: { selectedTab = tab }) {
            VStack(spacing: 2) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(selectedTab == tab ? Color.cyan : Color.white.opacity(0.6))

                Text(label)
                    .font(.caption2)
                    .foregroundColor(selectedTab == tab ? Color.cyan : Color.white.opacity(0.6))
            }
        }
    }
}
