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
    @State var itemName: String = ""
    
    var body: some View {
        NavigationStack {
            CodeScannerView(codeTypes: [.upce, .ean13]) { response in
                switch response {
                case .success(let result):
                    if !diary.meals.compactMap({ $0.name }).contains(meal.name) {
                        diary.meals.append(meal)
                    }
                    Task {
                        try! itemName = (await getNutritionFacts(barcode: result.string)["product"] as! [String: Any])["product_name"] as! String
                        meal.items.append(Item(name: itemName, servingSize: 0, calories: 0))
                    }
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
    
    func getNutritionFacts(barcode: String) async throws -> [String: Any] {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://world.openfoodfacts.net/api/v2/product/\(barcode)")!)
            return try (JSONSerialization.jsonObject(with: data) as? [String: Any])!
        }
    }
}
