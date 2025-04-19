//
//  TabBarItem.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 19/04/2025.
//

import SwiftUI

// MARK: - ⚠️❌⚠️❌⚠️❌⚠️❌⚠️❌ ONGOING CHANGES ⚠️❌⚠️❌⚠️❌⚠️❌⚠️❌
struct TabBarItem: View {
    let icon: String
    let label: String
    let tab: SwiftLabTabBarView.Tab
    @Binding var selectedTab: SwiftLabTabBarView.Tab

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(selectedTab == tab ? Color.cyan : Color.white.opacity(0.5))

            Text(label)
                .font(.caption2)
                .foregroundColor(selectedTab == tab ? Color.cyan : Color.white.opacity(0.5))
                .foregroundColor(selectedTab == tab ? Color.cyan : Color.white.opacity(0.6))
        }
        .frame(minWidth: 40)
        .onTapGesture {
            selectedTab = tab
        }
    }
}

//struct TabBarItem: View {
//    let icon: String
//    let label: String
//    let tab: SwiftLabTabBarView.Tab
//    @Binding var selectedTab: SwiftLabTabBarView.Tab
//
//    var body: some View {
//        VStack(spacing: 4) {
//            Image(systemName: icon)
//                .font(.system(size: 20))
//                .foregroundColor(selectedTab == tab ? Color.cyan : Color.white.opacity(0.6))
//
//            Text(label)
//                .font(.caption2)
//                .foregroundColor(selectedTab == tab ? Color.cyan : Color.white.opacity(0.6))
//        }
//        .frame(minWidth: 40)
//        .onTapGesture {
//            selectedTab = tab
//        }
//    }
//}
