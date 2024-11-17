//
//  Item.swift
//  Nutrition
//
//  Created by alex on 11/10/24.
//

import SwiftData

@Model
class Item {
    var name: String
    var meal: Meal?
    var servingSize: Int
    var calories: Int
    
    init(name: String, servingSize: Int, calories: Int) {
        self.name = name
        self.servingSize = servingSize
        self.calories = calories
    }
}
