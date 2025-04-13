//
//  CardView.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

struct CardView<Content: View>: View {
    // Parameters
    let title: String
    let subtitle: String?
    let content: Content
    
    // Shadow properties
    var shadowRadius: CGFloat
    var shadowOpacity: Double
    var shadowOffset: CGSize
    
    // Initializer with required and optional parameters and default values
    init(
        title: String,
        subtitle: String? = nil,
        shadowRadius: CGFloat = 8,
        shadowOpacity: Double = 0.2,
        shadowOffset: CGSize = CGSize(width: 0, height: 4),
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.subtitle = subtitle
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.shadowOffset = shadowOffset
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            // Card Title
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            // Optional Subtitle
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
            
            // Content - passed as a ViewBuilder
            content
                .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color.black)
        .cornerRadius(12)
        .shadow(
            color: Color.black.opacity(shadowOpacity),
            radius: shadowRadius,
            x: shadowOffset.width,
            y: shadowOffset.height
        )
        .padding()
    }
}

#Preview {
    CardView(title: "This is an example") {
        Text("You can literally put anything here 🙃")
            .foregroundColor(.white)
    }
}
