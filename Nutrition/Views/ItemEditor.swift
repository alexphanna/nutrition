//
//  ItemEditor.swift
//  Nutrition
//
//  Created by alex on 11/10/24.
//

import SwiftUI

struct ItemEditor: View { // Inspired by passwords app
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State var diary: Diary
    @State var meal: Meal
    
    @State private var name: String = ""
    @State private var servingSize: String = ""
    @State private var calories: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                LabeledContent {
                    TextField("Apple", text: $name)
                        .multilineTextAlignment(.trailing)
                } label: {
                    Text("Name")
                }
                LabeledContent {
                    TextField("0", text: $servingSize)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                } label: {
                    Text("Serving Size")
                }
                LabeledContent {
                    TextField("0", text: $calories)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                } label: {
                    Text("Calories")
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        withAnimation {
                            save()
                            dismiss()
                        }
                    }
                    .disabled(name.isEmpty || servingSize.isEmpty || calories.isEmpty)
                }
            }
            .navigationTitle("Add Item")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func save() {
        if !diary.meals.compactMap({ $0.name }).contains(meal.name) {
            diary.meals.append(meal)
        }
        meal.items.append(Item(name: name, servingSize: Int(servingSize)!, calories: Int(calories)!))
    }
}
