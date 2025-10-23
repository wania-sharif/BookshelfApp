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
        ScrollView {
            VStack {
                BookListItemView(book: book, width: 190, height: 280)
                
                Text(book.volumeInfo.title)
                    .font(.title)
                    .padding(5)
                    .kerning(0.3)
                
                Text(book.volumeInfo.authors[0])
                    .font(.callout)
                    .padding(.bottom, 20)
                
                HStack {
                    Button("Save", systemImage: "heart"){
                        
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
            
            Text(book.description ?? "Description unavailable")
                .padding(.top, 12)
        }
        .padding()
        .lineSpacing(2)
        .frame(maxWidth: 500)
        .foregroundStyle(Color.background2)
    }
}

#Preview {
    DetailView(book: Book.example)
}
