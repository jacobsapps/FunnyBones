//
//  DemoView.swift
//  
//
//  Created by Jacob Bartlett on 05/08/2023.
//
//
//import FunnyBones
//import SwiftUI
//
//struct DemoView: View {
//    
//    @EnvironmentObject var skeletonState: SkeletonState
//    @ObservedObject var viewModel: DemoViewModel = DemoViewModel()
//    
//    var body: some View {
//        NavigationView {
//            ZStack(alignment: .bottom) {
//                ScrollView {
//                    VStack(spacing: 24) {
//                        SkeletonView(with: viewModel.items,
//                                     sample: Item.sample()) {
//                            itemsView(with: $0)
//                        }
//                    }
//                    .padding(.vertical)
//                }
//                
//                skeletonToggle
//            }
//            .navigationTitle("Demo")
//        }
//    }
//    
//    @ViewBuilder
//    private var skeletonToggle: some View {
//        if #available(iOS 15, *) {
//            Picker("Togle skeleton view", selection: $skeletonState.showSkeleton) {
//                Text("Skeleton").tag(true)
//                Text("Content").tag(false)
//            }
//            .pickerStyle(.segmented)
//            .padding([.top, .horizontal])
//            .frame(maxWidth: .infinity, alignment: .center)
//            .background(.ultraThinMaterial)
//        }
//    }
//    
//    private func itemsView(with items: [Item]) -> some View {
//        ForEach(items, id: \.title) { item in
//            NavigationLink(destination: {
//                ItemDetails(item: item)
//            }, label: {
//                ItemCell(item: item)
//            })
//            .frame(maxWidth: .infinity, alignment: .center)
//        }
//        .padding(.horizontal)
//    }
//}
//
//final class DemoViewModel: ObservableObject {
//
//    @Published var items: [Item] = []
//    
//    init() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
//            self?.items = Array(repeating: Item.sample(), count: 6)
//        }
//    }
//}
//
//struct ItemCell: View {
//    
//    let item: Item
//    
//    var body: some View {
//        VStack(spacing: 4) {
//            HStack(alignment: .top) {
//                Text(item.title)
//                    .font(.headline)
//                    .foregroundColor(.black)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                
//                item.image
//                    .frame(width: 28, height: 28)
//                    .foregroundColor(.black)
//                    .padding(4)
//            }
//            
//            Text(item.body)
//                .font(.caption)
//                .foregroundColor(.black)
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
//            
//            Text(item.footer)
//                .foregroundColor(.black)
//                .font(.body)
//                .frame(maxWidth: .infinity, alignment: .trailing)
//        }
//        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.white)
//                .shadow(radius: 6)
//        )
//    }
//}
//
//struct ItemDetails: View {
//    
//    @EnvironmentObject var skeletonState: SkeletonState
//    let item: Item
//    
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            itemDetailsList(item: item)
//                .skeleton(redact: skeletonState.showSkeleton)
//            skeletonToggle
//        }
//    }
//    
//    private func itemDetailsList(item: Item) -> some View {
//        List {
//            item.image
//                .frame(width: 60, height: 60)
//                .foregroundColor(.black)
//                .frame(maxWidth: .infinity, alignment: .center)
//            
//            Text(item.body)
//                .font(.body)
//                .foregroundColor(.black)
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
//            
//            Divider()
//            
//            Text(item.body)
//                .font(.body)
//                .foregroundColor(.black)
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
//            
//            Divider()
//            
//            Text(item.body)
//                .font(.body)
//                .foregroundColor(.black)
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
//            
//            Text(item.footer)
//                .foregroundColor(.black)
//                .font(.subheadline)
//                .frame(maxWidth: .infinity, alignment: .trailing)
//        }
//        .navigationTitle(item.title)
//    }
//    
//    @ViewBuilder
//    private var skeletonToggle: some View {
//        if #available(iOS 15, *) {
//            Picker("Togle skeleton view", selection: $skeletonState.showSkeleton) {
//                Text("Skeleton").tag(true)
//                Text("Content").tag(false)
//            }
//            .pickerStyle(.segmented)
//            .padding([.top, .horizontal])
//            .frame(maxWidth: .infinity, alignment: .center)
//            .background(.ultraThinMaterial)
//        }
//    }
//}
//

//
//final class SkeletonState: ObservableObject {
//    @Published var showSkeleton: Bool = true
//}
//
//struct DemoView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        DemoView()
//            .environmentObject(SkeletonState())
//    }
//}
