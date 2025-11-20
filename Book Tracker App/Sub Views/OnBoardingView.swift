//
//  OnBoardingView.swift
//  Book Tracker App
//
//  Created by Wania Sharif on 2025-11-19.
//

import SwiftUI

struct OnBoardingView: View {
    // MARK: - Properties
    @Binding var onBoarding: Bool
    
    var titleText: String
    var descriptiontText: String
    var image: String
    var lastIndex = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment:.center, spacing: 20){
            if !lastIndex{
                Image(systemName: image)
                    .font(.custom("", size: 46))
            }
            Text(titleText)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            if descriptiontText != "" {
                Text(descriptiontText)
                    .multilineTextAlignment(.center)
                    .font(.headline)
            }
            
            // Display button if it is the last tab
            if lastIndex {
                Button("Start"){
                    onBoarding.toggle()
                }
                .tint(.blue)
            }
        }.padding()
            .fontWeight(.regular)
    }
}

#Preview {
    OnBoardingView(onBoarding: .constant(true), titleText: "Welcome to Bookshelf!", descriptiontText: "Keep track of all your reads and plan your next one!", image: "books.vertical")
}

#Preview("last"){
    OnBoardingView(onBoarding: .constant(true), titleText: "Lets go!", descriptiontText: "", image: "heart", lastIndex:  true)
}
