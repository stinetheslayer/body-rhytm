//
//  FitnessPageView.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 11/12/23.
//

import SwiftUI

struct FitnessPageView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.color4, .color3, .color2, .color1]),
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
        .edgesIgnoringSafeArea(.all)
        .overlay(
        VStack (alignment: .leading, spacing: 5) {
            Text("Fitness")
                .font(.title)
                .padding(.top, 20)
                .bold()
            WorkoutBoxView()
            Text("Weekly Activity Summary")
                .font(.title)
                .padding(.top, 20)
                .bold()
            WeeklyActivitySummaryView()
                .frame(width: 340, height: 201)
            Text("Workout Playlist")
                .font(.title)
                .padding(.top, 20)
                .bold()
            SleepMusicBoxView()
            
        }
            .padding()
            .brightness(0.2)
        )
    }
}

#Preview {
    FitnessPageView()
}
