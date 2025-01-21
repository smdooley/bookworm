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
    //@Query var books: [Book]
    
    // Sort by alphabetical order
    //@Query(sort: \Book.title) var books: [Book]
    //@Query(sort: [SortDescriptor(\Book.title)]) var books: [Book]
    //@Query(sort: [SortDescriptor(\Book.title, order: .reverse)]) var books: [Book]
    
    // Sort by rating, highest to lowest
    //@Query(sort: \Book.rating, order: .reverse) var books: [Book]
    
    // Sort by title then author
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    // Track whether the sheet is showing
    @State private var showingAddScreen = false
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
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
                                    .foregroundColor(book.rating == 1 ? .red : .primary)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                                Text(book.date, formatter: dateFormatter)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
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
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let book = books[offset]

            // delete it from the context
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
