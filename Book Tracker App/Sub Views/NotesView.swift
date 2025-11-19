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
        VStack{
            HStack{
                Button("", systemImage: "checkmark"){
                    bookNote?.text = noteContent
                    
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
                    // Populate textbox with existing note contents
                    .onChange(of: bookNote){
                        if let note = bookNote {
                            noteContent = note.text
                        }
                    }
                
            }
            .padding()
        }
        .background(Color.cream .gradient)
        .onAppear(){
            for note in notes {
                if note.id == bookId {
                    bookNote = note
                    print("Note with id: \(bookId) found")
                    print(note.text)
                }
            }
            
            if(bookNote == nil){
                let newNote = Note(id: bookId)
                context.insert(newNote)
                print("New note with id: \(bookId) created")
            }
        }
    }
}

#Preview {
    NotesView(bookId: "111")
}
