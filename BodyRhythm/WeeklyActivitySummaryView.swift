//
//  WeeklyActivitySummaryView.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 11/12/23.
//

import SwiftUI

struct WeeklyActivitySummaryView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.color4, .color3, .color4]),
            startPoint: .bottom,
            endPoint: .top
        )
        .mask(
        RoundedRectangle(cornerRadius: 20)
        .frame(width: 340, height: 201)
        .foregroundColor(.color2)
        )
        .overlay(
            Image("Calorie")
                .accessibilityLabel("Calorie Image")
           //     .resizable()
                .frame(width: 60,height: 60)
                .offset(x: -120, y:-50)
        )
        .overlay(
        Text("0")
            .font(.title)
            .offset(x:-50,y:-50)
            .bold()
            .accessibilityLabel("zero calories burnt")
        )
        .overlay(
        Text("cal")
            .font(.title3)
            .offset(x:-7,y:-47)
            .accessibilityLabel("zero calories burnt")
        )
        .overlay(
        Text("Calories Burnt")
            .accessibilityLabel("Section for burned calories")
            .font(.title2)
            .offset(x:-74)
            .bold()
        .overlay(
        Text("Ignite your strength! Begin your fitness adventure now. Every small effort counts. Embrace the challenge and pave the way to a fitter, healthier you.")
            .font(.custom("SF-Pro", size: 14))
            .frame(width: 321 , height: 67)
            .offset(x:5 ,y:50)
        )
        )
    }
}

#Preview {
    WeeklyActivitySummaryView()
}
