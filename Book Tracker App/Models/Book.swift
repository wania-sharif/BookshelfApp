//
//  Book.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-09-27.
//

import Foundation

struct Books: Codable {
    var items: [Book]
    
    static var example = Books(items: [Book.example,
                                       Book(
                                        id: "1342",
                                        volumeInfo: VolumeInfo(title: "Book Title",
                                                               authors: ["Jane Doe", "John Doe"],
                                                               imageLinks: ImageLinks(
                                                                smallThumbnail: "http://books.google.com/books/content?id=iJPhEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                                                                thumbnail: "http://books.google.com/books/content?id=iJPhEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
                                                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",),
                                       ),
                                       Book(
                                        id: "2312",
                                        volumeInfo: VolumeInfo(title: "Book Title",
                                                               authors: ["Jane Doe", "John Doe"],
                                                               imageLinks: ImageLinks(
                                                                smallThumbnail: "http://books.google.com/books/content?id=iJPhEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                                                                thumbnail: "http://books.google.com/books/content?id=iJPhEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
                                                               ),
                                                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
                                                              )
                                       )])
}

struct Book: Codable, Identifiable {
    static var example = Book(
        id: "2342",
        volumeInfo: VolumeInfo(title: "Book Title",
                               authors: ["Jane Doe", "John Doe"],
                               imageLinks: ImageLinks(
                                   smallThumbnail: "http://books.google.com/books/content?id=iJPhEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                                   thumbnail: "http://books.google.com/books/content?id=iJPhEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
                               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
        )
    
    var id: String
    var volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    var title: String
    var authors: [String]
    var imageLinks: ImageLinks?
    var description: String? = ""
}

struct ImageLinks: Codable {
    var smallThumbnail: String
    var thumbnail: String
}
