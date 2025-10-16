//
//  ShelvesView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-10-08.
//

import SwiftUI

//TODO: Replace placeholder array with shelf array
struct ShelvesView: View {
    //MARK: - Properties
    var books: Books
    
    var gridColumns = [
        GridItem(.flexible())
    ]
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 30) {
                    ForEach(books.items){ book in
                        NavigationLink(destination: ShelfView(books: books)){
                            HStack{
                                Section {
                                    Image(systemName: "book")
                                }
                                .frame(width: 70)
                                .border(Color.gray)
                                Text("ShelfName")
                                
                                Spacer()
                            }
                            .frame(width: 360, height: 90)
                            .border(Color.gray)
                            .foregroundStyle(Color.black)
                        }
                    }
                }
            }
            .navigationTitle("My shelves")
        }
    }
}

#Preview {
    ShelvesView(books: Books.example)
}
