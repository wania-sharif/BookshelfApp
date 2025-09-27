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
    @State private var searchFor: String = "r+f+kuang"
    
    var gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(books){ book in
                        Text(book.volumeInfo.title)
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
        }
    }
    
    // MARK: Function to query search and retrieve results
    func fetchData(){
        Task{
            let urlString = "https://www.googleapis.com/books/v1/volumes?q=" + "\(searchFor)"
            
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
