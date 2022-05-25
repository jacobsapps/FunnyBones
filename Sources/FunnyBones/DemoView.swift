//
//  DemoView.swift
//  
//
//  Created by Jacob Bartlett on 25/05/2022.
//

import SwiftUI

struct DemoView: View {
    
    @ObservedObject var viewModel: DemoViewModel = DemoViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                BonesView(data: viewModel.items,
                          placeholder: Item.placeholders,
                          content: { itemsView(with: $0) })
            }
        }
    }
    
    private func itemsView(with items: [Item]) -> some View {
        ForEach(items, id: \.title) { item in
            ItemCell(item: item)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal)
    }
}

final class DemoViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            self?.items = Item.placeholders
        }
    }
}

struct ItemCell: View {
    
    fileprivate var item: Item
    
    var body: some View {
        VStack(spacing: 16) {
            Text(item.title)
                .font(.headline)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 16) {
                Text(item.body)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                item.image
                    .foregroundColor(.primary)
            }
            
            Text(item.footer)
                .foregroundColor(.primary)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.secondary)
        )
    }
}

struct Item: Codable {
    
    var title: String
    var body: String
    var imageName: String
    var footer: String
    
    var image: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
    }
    
    static var placeholders: [Item] {
        titles.map {
            Item(title: $0,
                 body: lorumIpsum,
                 imageName: "note.text",
                 footer: "Here is the footer")
        }
    }
    
    static private var lorumIpsum: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    
    static private var titles: [String] = [
        "Title 1",
        "Title 2",
        "Title 3",
        "Title 4",
        "Title 5",
        "Title 6"
    ]
}

struct DemoView_Previews: PreviewProvider {
    
    static var previews: some View {
        DemoView()
    }
}
