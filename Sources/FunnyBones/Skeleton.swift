//
//  Skeleton.swift
//  
//
//  Created by Jacob Bartlett on 05/08/2023.
//

import SwiftUI

public extension View {
    
    func skeleton(redact: Bool) -> some View where Data.Element: Any {
        modifier(Skeleton(redact: redact))
    }
    
    func skeleton<Items: Collection>(items: Items) -> some View where Items.Element: Any {
        modifier(Skeleton(redact: items.isEmpty))
    }

}

struct Skeleton: ViewModifier {
    
    private let _shouldRedact: Bool
    
    init(redact: Bool) {
        self._shouldRedact = redact
    }
    
    func body(content: Content) -> some View {
        content
            .redacted(reason: _shouldRedact ? .placeholder : [])
            .allowsHitTesting(!_shouldRedact)
    }
}
