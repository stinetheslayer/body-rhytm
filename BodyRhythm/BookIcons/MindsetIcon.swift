//
//  MindsetIcon.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 12/12/23.
//

import SwiftUI

struct MindsetIcon: View {
    var body: some View {
        BookBoxView()
            .offset(x: 100, y: -120)
            .overlay(
                Image("Mindset")
                .resizable()
                .frame(width: 72, height: 120)
                .cornerRadius(20)
                .offset(x: 100, y: -120)
                .brightness(-0.2)
                )
    }
}

#Preview {
    MindsetIcon()
}
