//
//  FunnyBonesDemoApp.swift
//  FunnyBonesDemo
//
//  Created by Jacob Bartlett on 05/08/2023.
//

import SwiftUI

@main
struct FunnyBonesDemoApp: App {
    
    private var demoViewModel = DemoViewModel()
    
    var body: some Scene {
        WindowGroup {
            FunnyBonesTabView()
                .environmentObject(demoViewModel)
        }
    }
}
