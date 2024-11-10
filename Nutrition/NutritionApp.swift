//
//  NutritionApp.swift
//  Nutrition
//
//  Created by alex on 10/11/24.
//

import SwiftUI
import SwiftData

@main
struct NutritionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    Diary.self
                ])
        }
    }
}
