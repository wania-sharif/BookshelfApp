//
//  NotesView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-11-10.
//

import SwiftUI

struct NotesView: View {
    // MARK: - properties
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var noteContent: String = ""
    
    var book: Book
    
    // MARK: - body
    var body: some View {
        VStack{
            HStack{
                Button("", systemImage: "checkmark"){
                    //book.notes = noteContent
                    
                    if context.hasChanges {
                        try? context.save()
                    }
                    dismiss()
                }
                .padding(.trailing, 10)
                Button("", systemImage: "xmark"){
                    dismiss()
                }
            }
            .tint(Color(.white))
            .foregroundStyle(Color(.label))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal)
            .font(Font.title)
            .padding(.top, 30)
            
            ScrollView{
                TextEditor(text: $noteContent)
                    .textFieldStyle(.plain)
                    .frame(minHeight: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .lineSpacing(5)
                    .onAppear(){
                        if book.notes.isEmpty {
                            noteContent = " No notes yet. Add some!"
                        } else {
                            noteContent = book.notes
                        }
                    }
                
            }
            .padding()
        }
        .background(Color.background .gradient)
    }
}

#Preview {
    NotesView(book: Book.example)
}
