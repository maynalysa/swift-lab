//
//  CornerRadius.swift
//  SwiftLab
//
//  Created by mayane ndoumbe mbow on 19/04/2025.
//

import Foundation

// swiftlint:disable no_cgfloat
extension CGFloat {
    enum CornerRadius {
        static let none: CGFloat = 0       // sharp edges
        static let square: CGFloat = 2     // almost square, but not harsh
        static let rounded: CGFloat = 8    // general-purpose soft rounding
        static let softRound: CGFloat = 12 // gentler curve
        static let pill: CGFloat = 24      // ideal for chips, badges
        static let capsule: CGFloat = 999  // full rounding for height-based pills
        static let circle: CGFloat = 1000  // when width == height
    }
}
// swiftlint:enable no_cgfloat
