//
//  CarouselView.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 14/12/23.
//

import SwiftUI

struct CarouselView: View {
    @State private var selectedIndex = 0

    // Sample images for the carousel (replace these with your actual images)
    private let images = [Image("Cardio1"), Image("KickBoxing1"), Image("Pilates1"), Image("Yoga1"), Image("WeightTraining1")]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: -39) {
                ForEach(images.indices, id: \.self) { index in
                    WorkoutBoxView(image: images[index])  // Pass the image to each WorkoutBoxView
                        .scaleEffect(selectedIndex == index ? 1.0 : 0.8)
                        .onTapGesture {
                            withAnimation {
                                selectedIndex = index
                            }
                        }
                }
            }
            .padding(-17)
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
