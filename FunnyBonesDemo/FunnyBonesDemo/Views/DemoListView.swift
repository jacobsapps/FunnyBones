//
//  DemoListView.swift
//  
//
//  Created by Jacob Bartlett on 05/08/2023.
//

import FunnyBones
import SwiftUI

struct DemoListView: View {
    
    @EnvironmentObject var viewModel: DemoViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                SkeletonView(with: viewModel.items,
                             sample: Item.sample()) {
                    itemsView(with: $0)
                }
            }
            .padding(.vertical)
        }
    }

    private func itemsView(with items: [Item]) -> some View {
        ForEach(items, id: \.title) { item in
            ItemListCell(item: item)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal)
    }
}

struct ItemListCell: View {

    let item: Item

    var body: some View {
        VStack(spacing: 4) {
            HStack(alignment: .top) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)

                item.image
                    .frame(width: 28, height: 28)
                    .foregroundColor(.black)
                    .padding(4)
            }

            Text(item.body)
                .font(.caption)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(item.footer)
                .foregroundColor(.black)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(radius: 6)
        )
    }
}

struct DemoListView_Previews: PreviewProvider {
    static var previews: some View {
        DemoListView()
    }
}
