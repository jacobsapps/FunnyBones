//
//  FunnyBonesTabView.swift
//  FunnyBonesDemo
//
//  Created by Jacob Bartlett on 05/08/2023.
//

import FunnyBones
import SwiftUI

struct FunnyBonesTabView: View {
    
    @EnvironmentObject var viewModel: DemoViewModel
    
    var body: some View {
        NavigationView {
            TabView {
                DemoGridView()
                    .tabItem {
                        Label("Grid", systemImage: "square.grid.3x3")
                    }
                
                DemoListView()
                    .tabItem {
                        Label("List", systemImage: "list.dash")
                    }
                
                DemoSingleView()
                    .tabItem {
                        Label("Single", systemImage: "person")
                    }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        viewModel.toggleItems()
                        
                    }, label: {
                        viewModel.items.isEmpty ? Text("😃") : Text("💀")
                    })
                }
            }
            .navigationTitle("FunnyBones")
        }
    }
}

struct FunnyBonesTabView_Previews: PreviewProvider {
    static var previews: some View {
        FunnyBonesTabView()
    }
}
