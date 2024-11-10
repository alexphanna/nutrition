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
            LabeledContent("Calories", value: "50")
            LabeledContent("Protein", value: "25")
        }
        .navigationTitle("Apple")
    }
}
