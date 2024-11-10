//
//  Meal.swift
//  Nutrition
//
//  Created by alex on 11/10/24.
//

import SwiftData

@Model
class Meal {
    var name: String
    var items: [Item]
    
    init(name: String) {
        self.name = name
        self.items = [Item]()
    }
}
