//
//  CrushItIcon.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 12/12/23.
//

import SwiftUI

struct CrushItIcon: View {
    var body: some View {
                Image("CrushIt")
                .resizable()
                .frame(width: 72, height: 120)
                .cornerRadius(20)
                .offset(y: 100)
                .brightness(-0.2)
    }
}

#Preview {
    CrushItIcon()
}
