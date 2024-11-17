//
//  BarcodeScanner.swift
//  Nutrition
//
//  Created by alex on 11/16/24.
//

import CodeScanner
import SwiftUI

struct BarcodeScanner: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var diary: Diary
    @State var meal: Meal
    
    var body: some View {
        NavigationStack {
            CodeScannerView(codeTypes: [.upce, .ean13]) { response in
                switch response {
                case .success(let result):
                    if !diary.meals.compactMap({ $0.name }).contains(meal.name) {
                        diary.meals.append(meal)
                    }
                    meal.items.append(Item(name: result.string, servingSize: 0, calories: 0))
                    dismiss()
                    break
                case .failure:
                    break
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}
