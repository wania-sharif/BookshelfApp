//
//  ShelvesView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-10-08.
//

import SwiftUI
import SwiftData

struct ShelvesView: View {
    //MARK: - Properties
    @Query var shelves: [Shelf]
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    var gridColumns = [
        GridItem(.flexible())
    ]
    
    @State var newShelfName: String = ""
    @State var alertShowing = false
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            // Display shelves
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(shelves){ shelf in
                        NavigationLink(destination: ShelfView(shelf: shelf)){
                            HStack{
                                Section {
                                    Image(systemName: "book")
                                }
                                .frame(width: 70)
                                Text(shelf.name)
                                
                                Spacer()
                            }
                            .frame(width: 360, height: 80)
                            .background(Color.midnight)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(Color.cream)
                            .fontWeight(.semibold)
                        }
                    }
                }
            }
            .background(Color.cream)
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
                
                Button("Cancel"){
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    ShelvesView()
}
