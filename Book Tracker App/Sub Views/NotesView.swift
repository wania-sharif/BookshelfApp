//
//  NotesView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-11-10.
//

import SwiftUI
import SwiftData

struct NotesView: View {
    // MARK: - properties
    @Query var notes: [Note]
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var noteContent: String = ""
    @State private var bookNote: Note? = nil
    
    var bookId: String
    
    // MARK: - body
    var body: some View {
        NavigationStack{
            ScrollView{
                // Field for notes
                TextEditor(text: $noteContent)
                    .frame(minHeight: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .lineSpacing(5)
                    // Populate textbox with existing note contents
                    .onChange(of: bookNote){
                        if let note = bookNote {
                            noteContent = note.text
                        }
                    }
            }
            .navigationTitle("Notes")
            // Save and cancel buttons as toolbar group
            .toolbar(){
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("", systemImage: "checkmark"){
                        bookNote?.text = noteContent
                        
                        if context.hasChanges {
                            try? context.save()
                        }
                        dismiss()
                    }
                    Button("", systemImage: "xmark"){
                        dismiss()
                    }
                }
            }
            // Load or create note for book
            .onAppear(){
                // Find existing note by matching id
                for note in notes {
                    if note.id == bookId {
                        bookNote = note
                        print("Note with id: \(bookId) found")
                        print(note.text)
                    }
                }
                // If no note found for book's id, create one
                if(bookNote == nil){
                    let newNote = Note(id: bookId)
                    context.insert(newNote)
                    print("New note with id: \(bookId) created")
                }
            }
            .padding(30)
            .background(Color.cream2 .gradient)
        }
    }
}

#Preview {
    NotesView(bookId: "111")
}
