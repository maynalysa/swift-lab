//
//  CardCarouselViewModel.swift
//  SwiftUIExemples
//
//  Created by mayane ndoumbe mbow on 11/04/2025.
//

import SwiftUI

class CardCarouselViewModel<Data, ID>: ObservableObject where Data: RandomAccessCollection, ID: Hashable {
    private var data: Data
    private var id: KeyPath<Data.Element, ID>
    
    @Published var currentIndex: Int = 0
    @Published var totalItems: Int
    
    init(data: Data, id: KeyPath<Data.Element, ID>) {
        self.data = data
        self.id = id
        self.totalItems = data.count
    }
    
    func updateCurrentIndex(_ index: Int) {
        guard index >= 0 && index < totalItems else { return }
        currentIndex = index
    }
    
    func getItem(at index: Int) -> Data.Element? {
        guard index >= 0 && index < totalItems else { return nil }
        return data[data.index(data.startIndex, offsetBy: index)]
    }
    
    func getAllItems() -> [(index: Int, element: Data.Element)] {
        return Array(zip(0..<totalItems, data))
    }
}
