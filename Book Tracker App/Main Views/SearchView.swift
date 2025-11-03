//
//  SearchView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-09-27.
//

import SwiftUI

struct SearchView: View {
    //MARK: properties
    @State private var books: [Book] = []
    @State private var searchFor: String = "mistborn"
    
    var gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 46) {
                    // Display all books in search query
                    ForEach(books){ book in
                        NavigationLink(destination: DetailView(book: book)){
                            VStack{
                                BookListItemView(book: book, width: 150, height: 180)
                                    .shadow(radius: 4, x: 9, y: 6)
                                
                                Text(book.volumeInfo.title)
                                    .foregroundStyle(.black)
                                    .lineLimit(2)
                                    .frame(maxWidth: 150)
                                
                                Spacer()
                            }
                        }
                    }
                }
                .onAppear {
                    fetchData()
                }
                .searchable(text: $searchFor)   // Bind searchbar with variable
                .onSubmit(of: .search) {
                    fetchData()
                }
            }
            .navigationTitle("Search books")
            .padding(8)
            .background(Color.background .gradient)
        }
        
    }
    
    // MARK: Function to query search and retrieve results
    func fetchData(){
        Task{
            let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(searchFor)&key=AIzaSyAvHV-C9IDuTYEAIyD9bpi9CLW41yiczlc"
            
            guard let url = URL(string: urlString) else {
                return
            }
            
            // try to decode json data and sort by votes
            do {
                let (data,_) = try await
                URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                let fetchResults = try decoder.decode(Books.self, from: data)
                books = fetchResults.items
                
            } catch DecodingError.valueNotFound(let error, let message){
                print( "Value is missing: \(error) - \(message.debugDescription)")
            } catch DecodingError.typeMismatch(let error, let message){
                print( "Types do not match: \(error)- \(message.debugDescription)")
            } catch DecodingError.keyNotFound(let error, let message){
                print( "Incorrect property name: \(error)- \(message.debugDescription)")
            } catch {
                print( "Unknown error has occurred- \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    SearchView()
}
