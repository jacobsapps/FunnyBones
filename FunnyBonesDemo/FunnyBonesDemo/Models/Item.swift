//
//  Item.swift
//  FunnyBonesDemo
//
//  Created by Jacob Bartlett on 05/08/2023.
//

import SwiftUI

struct Item {

    var title: String
    var body: String
    var imageName: String
    var footer: String

    var image: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

    static func sample() -> Item {
        Item(title: "Title",
             body: lorumIpsum,
             imageName: "person",
             footer: "Here is the footer")
    }

    static private var lorumIpsum: String = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
"""
}
