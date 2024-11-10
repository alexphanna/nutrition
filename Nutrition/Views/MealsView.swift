//
//  MealsView.swift
//  Nutrition
//
//  Created by alex on 11/10/24.
//

import Foundation
import SwiftUI
import SwiftData

struct MealsView: View {
    @Query private var diaries: [Diary]
    var diary: Diary? { diaries.first }
    
    init(date: Date) {
        self._diaries = Query(filter: #Predicate<Diary> { diary in
            diary.date == date
        }, sort: \Diary.date)
    }
    
    var body: some View {
        List {
            if diary != nil {
                ForEach(diary!.meals) { meal in
                    DiarySection(meal: meal)
                }
            }
        }
    }
}
