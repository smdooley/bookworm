//
//  AddBookView.swift
//  Bookworm
//
//  Created by Sean Dooley on 03/12/2024.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    // Environment property to access model context
    @Environment(\.modelContext) var modelContext
    
    // Environment property to dismiss the view
    @Environment(\.dismiss) var dismiss
    
    // @State properties for each book value
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    // Possible genre options
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)

                    Picker("Rating", selection: $rating) {
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }
                }

                Section {
                    Button("Save") {
                        // add the book
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        
                        modelContext.insert(newBook)
                        
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}