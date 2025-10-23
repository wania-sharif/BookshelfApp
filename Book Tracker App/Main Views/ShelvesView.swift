//
//  ShelvesView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-10-08.
//

import SwiftUI
import SwiftData

//TODO: Replace placeholder array with shelf array
struct ShelvesView: View {
    //MARK: - Properties
    @Query var shelves: [Shelf]
    @Environment(\.modelContext) var context
    
    var gridColumns = [
        GridItem(.flexible())
    ]
    
    @State var newShelfName: String = ""
    @State var alertShowing = false
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 30) {
                    ForEach(shelves){ shelf in
                        NavigationLink(destination: ShelfView(shelf: shelf)){
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
            .toolbar(){
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add shelf", systemImage: "plus"){
                        alertShowing.toggle()
                    }
                }
            }
            // Prompt add shelf form
            .alert("", isPresented: $alertShowing){
                TextField("", text: $newShelfName)
                
                Button("Add shelf"){
                    let newShelf = Shelf(name: newShelfName)
                    context.insert(newShelf)
                }
            }
        }
    }
}

#Preview {
    ShelvesView()
}
