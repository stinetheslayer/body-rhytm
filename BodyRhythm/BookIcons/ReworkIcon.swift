//
//  ReworkIcon.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 12/12/23.
//

import SwiftUI

struct ReworkIcon: View {
    var body: some View {
        BookBoxView()
            .offset(x: 100, y: 100)
            .overlay(
                Image("Rework")
                .resizable()
                .frame(width: 72, height: 120)
                .cornerRadius(20)
                .offset(x: 100, y: 100)
                .brightness(-0.2)
                )
    }
}

#Preview {
    ReworkIcon()
}
