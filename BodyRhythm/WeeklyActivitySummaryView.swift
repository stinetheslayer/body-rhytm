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
                .resizable()
                .frame(width: 60,height: 60)
                .offset(x: -120, y:-50)
        )
        .overlay(
        Text("516")
            .font(.title)
            .offset(x:-50,y:-50)
            .bold()
        )
        .overlay(
        Text("cal")
            .font(.title3)
            .offset(x:-7,y:-47)
        )
        .overlay(
        Text("Calories Burnt")
            .font(.title2)
            .offset(x:-74)
            .bold()
        .overlay(
        Text("This week, you've crushed it! Your calorie burn is an incredible 65% higher than last week. Keep up the amazing work and enjoy the rewards of your dedication!")
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
