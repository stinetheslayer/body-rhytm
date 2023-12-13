//
//  Test.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 10/12/23.
//

import SwiftUI

struct SleepPageView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.color4, .color3, .color2, .color1]),
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
        .edgesIgnoringSafeArea(.all)
        .overlay(
            VStack(alignment: .leading, spacing: 5) {
                // Title for "Audio books"
                Text("Audio books")
                    .font(.title)
                    .padding(.top, 20)
                    .bold()
                AudioBooksBoxView()
                
                // Title for "Sleep Music"
                Text("Sleep Music")
                    .bold()
                    .font(.title)
                // Sleep Music Box with music details
                HStack {
                    Spacer()
                SleepMusicBoxView()
                    .frame(width: 340, height: 70)
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
            .brightness(+0.2)
        )
    }
}


struct SleepPageView_Previews: PreviewProvider {
    static var previews: some View {
        SleepPageView()
    }
}



