//
//  DemoView.swift
//
//
//  Created by Jacob Bartlett on 25/05/2022.
//

import SwiftUI

public struct BonesView<Content: View, Models: Collection>: View {
    
    private var data: Models
    private var placeholder: Models
//    @State private var timeout: Int = 3
    private let content: (Models) -> Content
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public init(data: Models,
                placeholder: Models,
                @ViewBuilder content: @escaping (Models) -> Content) {
        self.data = data
        self.placeholder = placeholder
        self.content = content
    }
    
    public var body: some View {
        Group {
            if data.isEmpty == true { // , timeout > 0 {
                content(placeholder)
                    .redacted(reason: .placeholder)
                    .allowsHitTesting(false)
                
            } else {
                content(data)
            }
        }
//        .onReceive(timer) { _ in
//            if timeout != 0 {
//                withAnimation {
//                    timeout -= 1
//                }
//            }
//        }
    }
}

public struct BonesSingleView<Content: View, Model: Any>: View {

    private var data: Model?
    private var placeholder: Model
    private let content: (Model?) -> Content

    public init(data: Model?,
                placeholder: Model,
                @ViewBuilder content: @escaping (Model?) -> Content) {
        self.data = data
        self.placeholder = placeholder
        self.content = content
    }

    public var body: some View {
        Group {
            if data == nil {
                content(placeholder)
                    .redacted(reason: .placeholder)
                    .allowsHitTesting(false)

            } else {
                content(data)
            }
        }
    }
}
