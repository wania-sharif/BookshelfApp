//
//  Book_Tracker_AppApp.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-09-27.
//

import SwiftUI
import SwiftData

@main
struct Book_Tracker_AppApp: App {
    //MARK: - properties
    @AppStorage("showOnboarding") var showOnboarding = true
    
    //MARK: - body
    var body: some Scene {
        WindowGroup {
            // Display OnBoarding if app is run for the first time
            if showOnboarding {
                TabView{
                    OnBoardingView(onBoarding: $showOnboarding, titleText: "Welcome to Bookshelf!", descriptiontText: "Keep track of all your reads and plan your next one", image: "book")
                    OnBoardingView(onBoarding: $showOnboarding, titleText: "Search Books", descriptiontText: "Search for books by title, author, or genre.", image: "magnifyingglass")
                    OnBoardingView(onBoarding: $showOnboarding, titleText: "Create shelves", descriptiontText: "Create shelves to organize your books", image: "list.bullet")
                    OnBoardingView(onBoarding: $showOnboarding, titleText: "Lets go!", descriptiontText: "", image: "heart", lastIndex:  true)
                }.tabViewStyle(.page)
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            else{
                // Display regular app view
                TabView {
//                    Tab("Home", systemImage: "house") {
//                        HomeView()
//                    }
                    Tab("My Shelves", systemImage: "square.fill.text.grid.1x2") {
                        ShelvesView()
                    }
                    Tab("Search", systemImage: "magnifyingglass") {
                        SearchView()
                    }
                }
            }
        }.modelContainer(for: [Shelf.self, Note.self])
    }
}
