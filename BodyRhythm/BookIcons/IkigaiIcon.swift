//
//  IkigaiIcon.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 12/12/23.
//

import SwiftUI

struct IkigaiIcon: View {
    var body: some View {
        BookBoxView()
            .offset(x: -100, y: -120)
            .overlay(
                Image("Ikigai")
                    .resizable()
                    .frame(width: 72, height: 120)
                    .cornerRadius(20) // Adjust the corner radius as needed
                    .brightness(-0.2)
                    .offset(x: -100, y: -120)
            )
    }
}



#Preview {
    IkigaiIcon()
}
