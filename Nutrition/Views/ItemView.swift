//
//  ItemView.swift
//  Nutrition
//
//  Created by alex on 10/11/24.
//

import SwiftUI

struct ItemView: View {
    @State var item: Item
    var body: some View {
        List {
            Section("Nutrition Facts") {
                LabeledContent("Calories", value: item.calories, format: .number)
                LabeledContent("Protein", value: "25")
            }
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.large)
    }
}
