//
//  PresentationDetent-MaxHeight.swift
//  
//
//  Created by Michael Zimmermann on 26.06.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

@available(iOS 16.0, *)
public extension PresentationDetent {
    static let maxHeight = Self.custom(MaxHeightPresentationDetent.self)
}

@available(iOS 16.0, *)
private struct MaxHeightPresentationDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        return context.maxDetentValue - 1
    }
}
