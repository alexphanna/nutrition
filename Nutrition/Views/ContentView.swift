//
//  ContentView.swift
//  Nutrition
//
//  Created by alex on 10/11/24.
//

import Foundation
import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Diary", systemImage: "book") {
                DiaryView()
            }
            Tab("Profile", systemImage: "person") {
                EmptyView()
            }
        }
    }
}
