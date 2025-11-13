//
//  Note.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-11-13.
//

import Foundation
import SwiftData

@Model class Note {
    static var example = Note(id: "111")
    @Attribute(.unique) var id: String
    var text: String = ""
    
    init(id: String) {
        self.id = id
        self.text = ""
    }
}
