//
//  Book.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-09-27.
//

import Foundation

struct Books: Codable {
    var items: [Book]
}

struct Book: Codable, Identifiable {
    var id: String
    var volumeInfo: VolumeInfo
    var description: String? = ""
    var imageLinks: ImageLinks?
}

struct VolumeInfo: Codable {
    var title: String
    var authors: [String]
}

struct ImageLinks: Codable {
    var smallThumbnail: String
    var thumbnail: String
}
