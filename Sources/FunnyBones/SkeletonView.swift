//
//  SkeletonView.swift
//  
//
//  Created by Jacob Bartlett on 05/08/2023.
//

import SwiftUI

public struct SkeletonView<Content: View,
                           Items: RangeReplaceableCollection>: View where Items.Element: Any {

    private let items: Items
    private let sample: Items.Element
    private let numberOfPlaceholders: Int
    private let content: (Items) -> Content
    
    public init(with items: Items,
                sample: Items.Element,
                numberOfPlaceholders: Int = 10,
                @ViewBuilder content: @escaping (Items) -> Content) {
        self.items = items
        self.sample = sample
        self.numberOfPlaceholders = numberOfPlaceholders
        self.content = content
    }
    
    private var _itemsToPopulateView: Items {
        if items.isEmpty {
            return Items(repeating: sample, count: numberOfPlaceholders)
            
        } else {
            return items
        }
    }
    
    public var body: some View {
        content(_itemsToPopulateView)
            .skeleton(items: items)
    }
}
