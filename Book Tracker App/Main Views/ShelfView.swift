//
//  ShelfView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-10-08.
//

import SwiftUI
import SwiftData

struct ShelfView: View {
    //MARK: - Properties
    @Query var shelves: [Shelf]
    @Environment(\.modelContext) var context
    
    var shelf: Shelf
    
    var gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 18) {
                    // Display books in selected shelf
                    ForEach(shelf.books){ book in
                        VStack{
                            BookListItemView(book: book, width: 130, height: 180)
                            Text(book.volumeInfo.title)
                        }
                    }
                }
            }
            .navigationTitle(shelf.name)
        }
    }
}

#Preview {
    ShelfView(shelf: Shelf(name: "1", books: [Book.example]))
}
