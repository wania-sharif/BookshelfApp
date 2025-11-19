//
//  BookListItemView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-09-28.
//

import SwiftUI

struct BookListItemView: View {
    var book: Book
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack{
            
            // If book has an image link, load it
            if let url = book.volumeInfo.imageLinks?.thumbnail {
                AsyncImage(url: URL(string: url)){ phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width, height: height)
                            .cornerRadius(2)
                        
                        // If load fails, display error image
                    } else if phase.error != nil {
                        VStack{}
                            .frame(width: width, height: height)
                            .aspectRatio(contentMode: .fit)
                            .border(Color.gray, width: 1)
                    } else {
                        ProgressView()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    BookListItemView(book: Book.example, width: 180, height: 270)
}
