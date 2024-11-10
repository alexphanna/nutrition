//
//  DiaryView.swift
//  Nutrition
//
//  Created by alex on 10/11/24.
//

import Foundation
import SwiftUI
import SwiftData
import HDatePicker
import CodeScanner

struct DiaryView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var selectedDay: Date = .now
    @State var temp: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HDatePicker(selectedDay: $selectedDay)
                    .onChange(of: selectedDay) {
                        modelContext.insert(Diary(date: selectedDay))
                    }
                Divider()
                MealsView(date: selectedDay)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("", systemImage: "gear", action: {})
                }
            }
        }
        .onAppear {
            modelContext.insert(Diary(date: selectedDay))
        }
    }
}
