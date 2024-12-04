//
//  DiarySection.swift
//  Nutrition
//
//  Created by alex on 10/11/24.
//

import SwiftUI
import CodeScanner

struct DiarySection: View {
    @State var diary: Diary
    @State var meal: Meal
    
    @Binding var selectedMeal: Meal?
    @Binding var sheet: Sheet
    
    var body: some View {
        Section(meal.name) {
            ForEach(meal.items) { item in
                ItemNavigationLink(item: item)
            }
            Menu {
                Button("Scan Barcode", systemImage: "barcode.viewfinder") {
                    sheet = .barcode
                    selectedMeal = meal
                }
                Button("Scan Nutrition Facts", systemImage: "text.viewfinder", action: {})
                    .disabled(true)
                Button("Enter Manually", systemImage: "character.cursor.ibeam") {
                    sheet = .manual
                    selectedMeal = meal
                }
            } label: {
                Label("Add Item", systemImage: "plus")
            }
        }
    }
}
