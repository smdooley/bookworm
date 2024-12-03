//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Sean Dooley on 03/12/2024.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    
    /*let modelContainer: ModelContainer
        
    init() {
        do {
            modelContainer = try ModelContainer(for: Book.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }*/
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
