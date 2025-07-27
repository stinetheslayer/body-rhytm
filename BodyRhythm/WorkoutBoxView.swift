//
//  WorkoutBoxView.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 11/12/23.
//

import SwiftUI

struct WorkoutBoxView: View {
    var image: Image  // Add an image property

    var body: some View {
        image  // Use the image here
            .resizable()  // Make the image resizable
            .frame(width: 200, height: 236)
            .cornerRadius(20)  // Apply corner radius to the image
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 4)  // Optional: Add a border
            )
    }
}
