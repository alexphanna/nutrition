//
//  DiarySection.swift
//  Nutrition
//
//  Created by alex on 10/11/24.
//

import SwiftUI
import CodeScanner

struct DiarySection: View {
    @State var meal: Meal
    @State var barcodeSheet: Bool = false
    @State var manualSheet: Bool = false
    
    var body: some View {
        Section(meal.name) {
            ForEach(meal.items) { item in
                ItemNavigationLink(item: item)
            }
            Menu {
                Button("Scan Barcode", systemImage: "barcode.viewfinder", action: { barcodeSheet = true })
                Button("Scan Nutrition Facts", systemImage: "text.viewfinder", action: {})
                    .disabled(true)
                Button("Enter Manually", systemImage: "character.cursor.ibeam", action: { manualSheet = true })
            } label: {
                Label("Add Item", systemImage: "plus")
            }
        }
        .sheet(isPresented: $manualSheet) {
            ItemEditor(meal: meal)
        }
        .sheet(isPresented: $barcodeSheet) {
            CodeScannerView(codeTypes: [.upce, .ean13]) { response in
                switch response {
                case .success(let result):
                    print(result.string)
                case .failure:
                    print("fail")
                }
                barcodeSheet = false
            }
        }
    }
}
