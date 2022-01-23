//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Yüksel Toprak on 23.01.22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
