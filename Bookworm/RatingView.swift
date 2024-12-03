//
//  RatingView.swift
//  Bookworm
//
//  Created by Sean Dooley on 03/12/2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)

    }
    
    /**
    To determine and return the appropriate image for a given rating level, indicating whether the level is active (selected) or inactive (unselected).

    - Parameters:
        - number: An integer representing the position or level of the rating being evaluated.
    - Returns:
        - An Image object. If number is greater than the current rating, it returns offImage if it is not nil; otherwise, it returns onImage. If number is less than or equal to the current rating, it returns onImage.
    */
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
