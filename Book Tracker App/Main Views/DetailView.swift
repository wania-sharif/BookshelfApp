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
    
    var book: Book
    
    @State var alertShowing = false
    @State var sheetShowing = false
    
    // MARK: - body
    var body: some View {
        let layout = verticalSizeClass == .compact ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        ScrollView {
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
                        .padding(.bottom, 20)
                    
                    if (verticalSizeClass == .regular){ Divider()}
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text(book.volumeInfo.description ?? "")
                    .padding(.top, 12)
            }
        }
        // Save and edit buttons as toolbar group
        .toolbar(){
            ToolbarItemGroup(placement: .topBarTrailing){
                Button("", systemImage: "heart"){
                    alertShowing.toggle()
                }
                Button("", systemImage: "pencil"){
                    sheetShowing.toggle()
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
        .padding(verticalSizeClass == .compact ? 5 : 20)
        .background(Color.background)
        .sheet(isPresented: $sheetShowing){
            NotesView(bookId: book.id)
                .presentationDetents([.medium, .large])
        }
    }
    
}

#Preview {
    DetailView(book: Book.example)
}
