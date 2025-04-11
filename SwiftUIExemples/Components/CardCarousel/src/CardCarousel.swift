//
//  CardCarousel.swift
//  SwiftUIExemples
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

struct CardCarousel<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View {
    @StateObject private var viewModel: CardCarouselViewModel<Data, ID>
    private var content: (Data.Element) -> Content
    private var spacing: CGFloat
    private var alignment: VerticalAlignment
    private var cardWidth: CGFloat
    
    init(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        spacing: CGFloat = 16,
        alignment: VerticalAlignment = .center,
        cardWidth: CGFloat = 300,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self._viewModel = StateObject(wrappedValue: CardCarouselViewModel(data: data, id: id))
        self.spacing = spacing
        self.alignment = alignment
        self.cardWidth = cardWidth
        self.content = content
    }
    
    var body: some View {
        VStack {
            // Carousel display
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: spacing, pinnedViews: []) {
                        ForEach(viewModel.getAllItems(), id: \.index) { index, item in
                            content(item)
                                .frame(width: cardWidth)
                                .id(index)
                                .onTapGesture {
                                    viewModel.updateCurrentIndex(index)
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                    .onChange(of: viewModel.currentIndex, { _, newIndex in
                        withAnimation {
                            scrollProxy.scrollTo(newIndex, anchor: .center)
                        }
                    })
                    .onAppear {
                        // Start at the first item when the view appears
                        if viewModel.totalItems > 0 {
                            viewModel.updateCurrentIndex(0)
                        }
                    }
                }
            }
            
            // Page indicator dots
            if viewModel.totalItems > 1 {
                HStack(spacing: 8) {
                    ForEach(0..<viewModel.totalItems, id: \.self) { index in
                        Circle()
                            .fill(viewModel.currentIndex == index ? Color.blue : Color.gray.opacity(0.5))
                            .frame(width: 8, height: 8)
                            .onTapGesture {
                                viewModel.updateCurrentIndex(index)
                            }
                    }
                }
                .padding(.top, 16)
            }
        }
    }
}

//struct CardCarousel<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View {
//    private var data: Data
//    private var content: (Data.Element) -> Content
//    private var spacing: CGFloat
//    private var alignment: VerticalAlignment
//    private var cardWidth: CGFloat
//    private var id: KeyPath<Data.Element, ID>
//    
//    @State private var currentIndex: Int = 0
//    
//    init(
//        data: Data,
//        id: KeyPath<Data.Element, ID>,
//        spacing: CGFloat = 16,
//        alignment: VerticalAlignment = .center,
//        cardWidth: CGFloat = 300,
//        @ViewBuilder content: @escaping (Data.Element) -> Content
//    ) {
//        self.data = data
//        self.id = id
//        self.spacing = spacing
//        self.alignment = alignment
//        self.cardWidth = cardWidth
//        self.content = content
//    }
//    
//    var body: some View {
//        VStack {
//            // Carousel display
//            ScrollViewReader { scrollProxy in
//                ScrollView(.horizontal, showsIndicators: false) {
//                    LazyHStack(spacing: spacing, pinnedViews: []) {
//                        ForEach(data, id: id) { item in
//                            content(item)
//                                .frame(width: cardWidth)
//                                .id(data.firstIndex(where: { $0[keyPath: id] == item[keyPath: id] }) ?? 0)
//                        }
//                    }
//                    .padding(.horizontal, 20)
//                    .onAppear {
//                        // Start at the first item when the view appears
//                        if !data.isEmpty {
//                            currentIndex = 0
//                            scrollProxy.scrollTo(currentIndex, anchor: .center)
//                        }
//                    }
//                }
//            }
//            
//            // Optional: Page indicator dots
//            HStack(spacing: 8) {
//                ForEach(0..<data.count, id: \.self) { index in
//                    Circle()
//                        .fill(currentIndex == index ? Color.blue : Color.gray.opacity(0.5))
//                        .frame(width: 8, height: 8)
//                }
//            }
//            .padding(.top, 16)
//        }
//    }
//}
//
