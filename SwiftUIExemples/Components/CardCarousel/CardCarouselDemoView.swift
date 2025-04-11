//
//  CardCarouselDemoView.swift
//  SwiftUIExemples
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

struct CardCarouselDemoView: View {
    // Sample data for cards
    struct CardItem: Identifiable {
        let id = UUID()
        let title: String
        let subtitle: String?
        let imageSystemName: String
        let description: String
    }
    
    let items: [CardItem] = [
        CardItem(
            title: "Nature",
            subtitle: "Explore the wilderness",
            imageSystemName: "leaf.fill",
            description: "Discover the beauty of natural landscapes and wildlife."
        ),
        CardItem(
            title: "Technology",
            subtitle: "Latest innovations",
            imageSystemName: "laptopcomputer",
            description: "Stay updated with cutting-edge tech and gadgets."
        ),
        CardItem(
            title: "Food",
            subtitle: nil,
            imageSystemName: "fork.knife",
            description: "Delicious recipes and culinary adventures await."
        ),
        CardItem(
            title: "Travel",
            subtitle: "Destinations",
            imageSystemName: "airplane",
            description: "Explore exotic locations around the world."
        ),
        CardItem(
            title: "Fitness",
            subtitle: "Stay healthy",
            imageSystemName: "figure.walk",
            description: "Tips and routines for maintaining your health."
        )
    ]
    
    var body: some View {
        VStack {
            Text("Featured Categories")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            CardCarousel(
                data: items,
                id: \.id,
                spacing: 20,
                cardWidth: 280
            ) { item in
                CardView(
                    title: item.title,
                    subtitle: item.subtitle
                ) {
                    VStack(alignment: .leading, spacing: 16) {
                        Image(systemName: item.imageSystemName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .foregroundColor(.blue)
                            .padding(.horizontal, 20)
                        
                        Text(item.description)
                            .foregroundColor(.secondary)
                            .lineLimit(3)
                        
                        Button(action: {
                            // Action here
                        }) {
                            Text("Learn More")
                                .fontWeight(.semibold)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top, 8)
                    }
                }
            }
            .frame(height: 350)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
    }
}



#Preview {
    CardCarouselDemoView()
}
