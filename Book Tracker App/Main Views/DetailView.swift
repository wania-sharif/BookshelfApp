//
//  DetailView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-10-19.
//

import SwiftUI

struct DetailView: View {
    // MARK: - properties
    var book: Book
    
    // MARK: - body
    var body: some View {
        VStack {
            BookListItemView(book: book, width: 190, height: 280)
            
            Text(book.volumeInfo.title)
                .font(.title)
                .padding(10)
                .kerning(0.3)
            
            Text(book.volumeInfo.authors[0])
                .font(.callout)
            
            Button("Save", systemImage: "heart"){
                
            }.buttonStyle(.bordered)
            
            Divider()
                .padding(.top, 10)
                .padding(.bottom, 30)
            
            Text(book.description ?? "Description unavailable")
        }
        .padding()
        .lineSpacing(2)
        .frame(maxWidth: 500)
        .fontWeight(.light)
    }
}

#Preview {
    DetailView(book: Book.example)
}
