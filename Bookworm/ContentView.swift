//
//  ContentView.swift
//  Bookworm
//
//  Created by Sean Dooley on 03/12/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // Model Context to access books
    @Environment(\.modelContext) var modelContext
    
    // Query to read all the books
    @Query var books: [Book]
    
    // Track whether the sheet is showing
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            //Text("Count: \(books.count)")
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
}

#Preview {
    ContentView()
}
