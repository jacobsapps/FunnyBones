//
//  ItemViewModel.swift
//  FunnyBonesDemo
//
//  Created by Jacob Bartlett on 05/08/2023.
//

import SwiftUI

final class DemoViewModel: ObservableObject {

    @Published var items: [Item] = []
    private let _storedItems: [Item] = Array(repeating: Item.sample(), count: 10)
 
    func toggleItems() {
        withAnimation {
            if items.isEmpty {
                items = _storedItems
            } else {
                items = []
            }
        }
    }
}
