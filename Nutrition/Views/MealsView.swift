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
    @Environment(\.dismiss) private var dismiss
    
    @Query private var diaries: [Diary]
    var diary: Diary? { diaries.first }
    @State private var selectedMeal: Meal? = nil
    @State private var sheet: Sheet = .barcode
    
    init(date: Date) {
        self._diaries = Query(filter: #Predicate<Diary> { diary in
            diary.date == date
        }, sort: \Diary.date)
    }
    
    var body: some View {
        List {
            if diary != nil {
                ForEach(diary!.meals.sorted { $0.priority < $1.priority }) { meal in
                    DiarySection(meal: meal, selectedMeal: $selectedMeal, sheet: $sheet)
                }
            }
        }
        .sheet(item: $selectedMeal) { meal in
            if sheet == .manual {
                ItemEditor(meal: meal)
            }
            else if sheet == .barcode {
                CodeScannerView(codeTypes: [.upce, .ean13], scanMode: .once, showViewfinder: true) { response in
                    switch response {
                    case .success(let result):
                        selectedMeal?.items.append(Item(name: result.string, servingSize: 0, calories: 0))
                    case .failure:
                        break
                    }
                }
            }
        }
    }
}

enum Sheet {
    case manual, barcode
}
