//
//  AudioBooksBoxView.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 11/12/23.
//

import SwiftUI

struct AudioBooksBoxView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.color4, .color3, .color4]),
            startPoint: .bottom,
            endPoint: .top
        )
        .mask(
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 340, height: 490)
            
        )
        .overlay(
            IkigaiIcon()
        )
        .overlay(
            TheSecretIcon()
        )
        .overlay(
            MindsetIcon()
        )
        .overlay(
            GritIcon()
        )
        .overlay(
            CrushItIcon()
        )
        .overlay(
            ReworkIcon()
        )
    // section for name of the books
        .overlay(
            Text("Ikigai")
                .foregroundColor(.white)
                .offset(x: -101, y: -45)
                .font(.headline)
        )
        .overlay(
            Text("The Secret")
                .foregroundColor(.white)
                .offset(x:01,y: -45)
                .font(.headline)
            )
        .overlay(
            Text("Mindset")
                .foregroundColor(.white)
                .offset(x:101,y: -45)
                .font(.headline)
            )
        .overlay(
            Text("Grit")
                .foregroundColor(.white)
                .offset(x:-99 , y: 175)
                .font(.headline)
                )
        .overlay(
            Text("Crush It")
                .foregroundColor(.white)
                .offset(x:01 , y: 175)
                .font(.headline)
                )
        .overlay(
            Text("Rework")
                .foregroundColor(.white)
                .offset(x:101 , y: 175)
                .font(.headline)
                )
        // section for name of the author
        .overlay(
            Text("Author")
                .foregroundColor(.white)
                .offset(x:101 , y: 205)
                .font(.headline)
                )
        .overlay(
                Text("Author")
                .foregroundColor(.white)
                .offset(x:01 , y: 205)
                .font(.headline)
                )
        .overlay(
                Text("Author")
                .foregroundColor(.white)
                .offset(x:-99 , y: 205)
                .font(.headline)
                )
        .overlay(
                Text("Author")
                .foregroundColor(.white)
                .offset(x:-101 , y: -15)
                .font(.headline)
                )
        .overlay(
                Text("Author")
                .foregroundColor(.white)
                .offset(x:01 , y: -15)
                .font(.headline)
                )
        .overlay(
                Text("Author")
                .foregroundColor(.white)
                .offset(x:99 , y: -15)
                .font(.headline)
                )
    }
}


#Preview {
    AudioBooksBoxView()
}
