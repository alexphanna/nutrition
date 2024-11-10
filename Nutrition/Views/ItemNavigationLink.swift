//
//  ItemNavigationLink.swift
//  Nutrition
//
//  Created by alex on 11/10/24.
//

import SwiftUI

struct ItemNavigationLink: View {
    @State var item: Item
    
    var body: some View {
        NavigationLink {
            ItemView(item: item)
        } label: {
            LabeledContent(item.name, value: "50")
        }
    }
}
