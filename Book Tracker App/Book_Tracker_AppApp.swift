//
//  Book_Tracker_AppApp.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-09-27.
//

import SwiftUI

@main
struct Book_Tracker_AppApp: App {
    //MARK: - properties
    
    //MARK: - body
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Home", systemImage: "house") {
                    HomeView()
                }
                Tab("Search", systemImage: "magnifyingglass") {
                    SearchView()
                }
                Tab("My Shelves", systemImage: "square.fill.text.grid.1x2") {
                    ShelvesView(books: Books.example)
                }
            }
        }
    }
}
