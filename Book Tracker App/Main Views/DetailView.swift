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
    
    var book: Book
    
    @State var alertShowing = false
    
    // MARK: - body
    var body: some View {
        ScrollView {
            VStack {
                BookListItemView(book: book, width: 150, height: 240)
                    .shadow(radius: 19, x: 9, y: 6)
                
                Text(book.volumeInfo.title)
                    .font(.title)
                    .padding(5)
                    .kerning(0.3)
                
                Text(book.volumeInfo.authors?[0] ?? "")
                    .font(.callout)
                    .padding(.bottom, 20)
                
                Divider()
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(book.volumeInfo.description ?? "Description unavailable")
                .padding(.top, 12)
        }
        // Save and edit buttons as toolbar group
        .toolbar(){
            ToolbarItemGroup(placement: .topBarTrailing){
                Button("", systemImage: "heart"){
                    alertShowing.toggle()
                }
                Button("", systemImage: "pencil"){
                    
                }
            }
        }
        // Shelf select menu
        .alert("Choose shelf", isPresented: $alertShowing){
            ForEach(shelves) { shelf in
                Button(shelf.name){
                    shelf.books.append(book)
                    if context.hasChanges {
                        try? context.save()
                    }
                    alertShowing.toggle()
                }
            }
        }
        .lineSpacing(2)
        .frame(maxWidth: 500)
        .padding()
        .background(Color.background)
    }
}

#Preview {
    DetailView(book: Book.example)
}
