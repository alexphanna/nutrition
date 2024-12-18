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
    @Query private var diaries: [Diary]
    
    private var calendar = Calendar.current
    
    var body: some View {
        let dateWithoutTime = calendar.date(from: calendar.dateComponents([.year, .month, .day], from: selectedDay))!
        NavigationView {
            VStack(spacing: 0) {
                HDatePicker(selectedDay: $selectedDay)
                    .onChange(of: selectedDay) {
                        if !diaries.compactMap({ $0.date }).contains(where: { calendar.isDate($0, inSameDayAs: dateWithoutTime) }) {
                            modelContext.insert(Diary(date: dateWithoutTime))
                        }
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
            if !diaries.compactMap({ $0.date }).contains(where: { calendar.isDate($0, inSameDayAs: dateWithoutTime) }) {
                modelContext.insert(Diary(date: dateWithoutTime))
            }
        }
    }
}
