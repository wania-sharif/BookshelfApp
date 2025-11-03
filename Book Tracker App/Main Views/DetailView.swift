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
                
                Text(book.volumeInfo.title)
                    .font(.title)
                    .padding(5)
                    .kerning(0.3)
                
                Text(book.volumeInfo.authors?[0] ?? "")
                    .font(.callout)
                    .padding(.bottom, 20)
                
                HStack {
                    Button("Save", systemImage: "heart"){
                        alertShowing.toggle()
                    }

                    Button("Notes", systemImage: "pencil"){
                        
                    }
                }
                .buttonStyle(.bordered)
                .padding(.bottom, 10)
                
                Divider()
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(book.volumeInfo.description ?? "Description unavailable")
                .padding(.top, 12)
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
        .foregroundStyle(Color.background2)
        .padding()
    }
}

#Preview {
    DetailView(book: Book.example)
}
