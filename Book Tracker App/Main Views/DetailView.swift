//
//  DetailView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-10-19.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    // MARK: - properties
    @Query var shelves: [Shelf]
    @Environment(\.modelContext) var context
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.dismiss) var dismiss
    
    var book: Book
    
    @State var alertShowing = false
    
    // MARK: - body
    var body: some View {
        let layout = verticalSizeClass == .compact ? AnyLayout(HStackLayout(alignment: .top)) : AnyLayout(VStackLayout())
        
        ScrollView {
            // If device has small verticality, stack components horizontally
            layout {
                VStack {
                    BookListItemView(book: book, width: 150, height: 240)
                        .shadow(radius: 10, x: 9, y: 9)
                    
                    Text(book.volumeInfo.title)
                        .font(.title2)
                        .padding(5)
                        .kerning(0.3)
                        .bold()
                    
                    Text(book.volumeInfo.authors?[0] ?? "")
                        .font(.callout)
                        .padding(.bottom)
                    
                    if let categories = book.volumeInfo.categories {
                        Text(categories[0].uppercased())
                            .font(.caption)
                            .padding(.bottom)
                    }
                    
                    if (verticalSizeClass == .regular){ Divider() }
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text(book.volumeInfo.description ?? "")
                    .padding(.top, verticalSizeClass == .regular ? 12 : 40)
                    .frame(maxWidth: 600)
                    .font(.callout)
            }
        }
        // Save and edit buttons as toolbar group
        .toolbar(){
            ToolbarItemGroup(placement: .topBarTrailing){
                Button("", systemImage: "plus"){
                    alertShowing.toggle()
                }
                NavigationLink(destination: NotesView(bookId: book.id)){
                    Label("", systemImage: "long.text.page.and.pencil")
                }
            }
        }
        // Shelf select menu
        .alert("Choose shelf", isPresented: $alertShowing){
            ForEach(shelves) { shelf in
                Button(shelf.name){
                    // Find book in shelf
                    let has = shelf.books.contains {$0.id == book.id}
                    // If it is not already in shelf, add it
                    if has == false {
                        shelf.books.append(book)
                        if context.hasChanges {
                            try? context.save()
                        }
                        alertShowing.toggle()
                    }
                }
            }
            Button("Cancel"){}
        }
        .lineSpacing(2)
        .padding(verticalSizeClass == .compact ? 5 : 20)
        .background(Color.cream)
    }
    
}

#Preview {
    DetailView(book: Book.example)
}
