//
//  Shelf.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-10-23.
//

import Foundation
import SwiftData

@Model class Shelf {
    var name: String
    var books: [Book]
    
    init(name: String, books: [Book] = []) {
        self.name = name
        self.books = books
    }
}
