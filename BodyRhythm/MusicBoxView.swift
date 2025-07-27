//
//  SleepMusicBoxView.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 11/12/23.
//

import SwiftUI

struct MusicBoxView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.color4, .color3]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .mask(
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 340, height: 70)

        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .offset(x: -135)
        )
        // section for music name
        .overlay(
            Text("Music Name")
                .foregroundColor(Color("LabelColor"))
                .bold()
                .offset(x: -55, y: -9)
                .font(.title3)
        )
        // section for name of the singer
        .overlay(
            Text("Singer Name")
                .foregroundColor(Color("LabelColor"))
                .offset(x: -65, y: +10)
                .font(.subheadline)
        )
        // section for changing the music
        .overlay(
            Image("Music")
                .offset(x: +85)
        )
    }
}

struct MusicBoxView_Previews: PreviewProvider {
    static var previews: some View {
        MusicBoxView()
    }
}

