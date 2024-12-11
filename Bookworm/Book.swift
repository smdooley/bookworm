//
//  Book.swift
//  Bookworm
//
//  Created by Sean Dooley on 03/12/2024.
//

//import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
    
//    var isValid: Bool {
//        if title.isBlank || author.isBlank || genre.isBlank || review.isBlank {
//            return false
//        }
//        
//        return true
//    }
}
