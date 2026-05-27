<img width="200" height="200" alt="bookshelfAppIcon" src="https://github.com/user-attachments/assets/f1c7936a-0ea6-4c08-b618-a39e5fdcccb2" />

# Bookshelf App

A mobile iOS application to search books, create and manage reading collections, and write notes.


## ✨ App Features

- Search Feature: Utilizes a REST API (Google Books API) to allow users to search for books by title, author, or genre. 

- Persistent Data Storage: Seamless local data persistence allowing users to save books in defined collections, as well as write notes for saved books.

## 🛠 Tech Stack

**SwiftU/UIKiI:** Creating User Interface 

**SwiftData:** Abstracting local storage

**Networking:** Fetch JSON data from API using URLSession to perform HTTP requests


## ⚙️ Run Locally

1. Clone the project

```bash
  git clone https://github.com/wania-sharif/BookshelfApp.git
```

2. Open `BookTracker.xcodeproj` in Xcode 15+ (or whatever version you are using).

3. Create a file named config.swift with the following contents:

```bash
import Foundation

struct APIConfig {
    static let API_KEY = GOOGLE_API_KEY_STRING
}
```

4. Select a simulator (e.g., iPhone 15) and press Cmd + R to run.


## Screenshots
<img width="386" height="734" alt="image" src="https://github.com/user-attachments/assets/d7056f90-33b0-4f43-be30-b1064a322480" />
<img width="386" height="734" alt="image" src="https://github.com/user-attachments/assets/96a4c5d4-a323-4095-8ab6-d8e7fc3964c0" />
<img width="386" height="734" alt="image" src="https://github.com/user-attachments/assets/fae11348-af96-48f5-a228-1bff5c64da14" />

