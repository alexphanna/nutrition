//
//  Day.swift
//  Nutrition
//
//  Created by alex on 11/10/24.
//

import Foundation
import SwiftData

@Model
class Diary {
    var meals: [Meal]
    @Attribute(.unique) var date: Date
    
    init(date: Date) {
        let mealNames = ["Breakfast", "Lunch", "Dinner", "Snacks"]
        self.date = date
        self.meals = [Meal]()
        var priority = 0
        for mealName in mealNames {
            self.meals.append(Meal(name: mealName, priority: priority))
            priority += 1
        }
    }
}
