//
//  BookBoxView.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 11/12/23.
//

import SwiftUI

struct BookBoxView: View {
    var body: some View {
            LinearGradient(
                gradient: Gradient(colors: [.color6,.color5, .white]),
                startPoint: .bottom,
                endPoint: .top
                )
            .mask(
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 72, height: 120)
            .foregroundColor(.color2)
        )
    }
}
#Preview {
    BookBoxView()
}
