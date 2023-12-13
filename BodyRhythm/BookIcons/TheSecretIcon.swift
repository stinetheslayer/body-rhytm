//
//  TheSecretIcon.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 12/12/23.
//

import SwiftUI

struct TheSecretIcon: View {
    var body: some View {
        BookBoxView()
            .offset(y: -120)
            .overlay(
                Image("TheSecret")
                .resizable()
                .frame(width: 72, height: 120)
                .cornerRadius(20)
                .offset(y: -120)
                .brightness(-0.2)
                )
    }
}

#Preview {
    TheSecretIcon()
}
