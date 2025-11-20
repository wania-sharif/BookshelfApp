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
    
    @State private var draggingItem: String = ""
    
    var shelf: Shelf
    
    var gridColumns = [
        GridItem(.adaptive(minimum: 160)),
    ]
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 38) {
                    // Display books in selected shelf
                    ForEach(shelf.books){ book in
                        NavigationLink(destination: DetailView(book: book)){
                            // Drag and drop is only supported in iOS 26.0 and above
                            if #available(iOS 26.0, *) {
                                VStack(){
                                    BookListItemView(book: book, width: 140, height: 180)
                                    Text(book.volumeInfo.title)
                                        .foregroundStyle(.black)
                                        .lineLimit(2)
                                        .frame(maxWidth: 150)
                                }
                                .frame(width: 160, height: 240)
                                // Make list item draggable
                                .draggable(book.id){
                                    //when you click on the item to move, what appears on the screen
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 110, height: 160)
                                        .onAppear(){
                                            //set the dragging item to be this list item
                                            draggingItem = book.id
                                            
                                        }
                                }
                                
                                //set it up to drop
                                .dropDestination(for: String.self, isEnabled: true) { _, _ in
                                    
                                    //get the index of the dragging item
                                    //get the index of where you are dropping it
                                    if let sourceIndex = shelf.books.firstIndex(where: { $0.id == draggingItem }){
                                        if let destinationIndex = shelf.books.firstIndex(where: { $0.id == book.id }){
                                            withAnimation{
                                                let sourceItem = shelf.books.remove(at: sourceIndex)
                                                shelf.books.insert(sourceItem, at: destinationIndex)
                                            }
                                        }
                                    }
                                }
                            } else {    // If version is under 26, show the book item without reorder functionality
                                VStack(){
                                    BookListItemView(book: book, width: 140, height: 180)
                                    Text(book.volumeInfo.title)
                                        .foregroundStyle(.black)
                                        .lineLimit(2)
                                        .frame(maxWidth: 150)
                                }
                                .frame(width: 160, height: 240)
                            }
                        }
                    }
                }
            }
            .navigationTitle(shelf.name)
        }
    }
}

#Preview {
    ShelfView(shelf: Shelf(name: "shelf1", books: [Book.example]))
}
