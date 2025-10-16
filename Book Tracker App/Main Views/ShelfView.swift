//
//  ShelfView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-10-08.
//

import SwiftUI

struct ShelfView: View {
    //MARK: - Properties
    var books: Books
    
    var gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 10) {
                    ForEach(books.items){ book in
                        BookListItemView(book: book, width: 130, height: 180)
                    }
                }
            }
            .navigationTitle("Shelf Name")
        }
    }
}

#Preview {
    ShelfView(books: Books.example)
}
