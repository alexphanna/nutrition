//
//  MealsView.swift
//  Nutrition
//
//  Created by alex on 11/10/24.
//

import CodeScanner
import Foundation
import SwiftUI
import SwiftData

struct MealsView: View {
    @Query private var diaries: [Diary]
    var diary: Diary? { diaries.first }
    @State private var selectedMeal: Meal? = nil
    @State private var sheet: Sheet = .barcode
    
    init(date: Date) {
        self._diaries = Query(filter: #Predicate<Diary> {
            $0.date <= date
        }, sort: \Diary.date, order: .reverse)
    }
    
    var body: some View {
        List {
            if diary != nil {
                ForEach(diary!.meals.sorted { $0.priority < $1.priority }) { meal in
                    DiarySection(diary: diary!, meal: meal, selectedMeal: $selectedMeal, sheet: $sheet)
                }
            }
        }
        .sheet(item: $selectedMeal) { meal in
            if sheet == .manual {
                ItemEditor(diary: diary!, meal: meal)
            }
            else if sheet == .barcode {
                BarcodeScanner(diary: diary!, meal: meal)
            }
        }
    }
}

enum Sheet {
    case manual, barcode
}
