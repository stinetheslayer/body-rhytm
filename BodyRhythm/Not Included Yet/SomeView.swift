//
//  SomeView.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 12/12/23.
//

import SwiftUI

struct SomeView: View {
    let numberOfRectangles = 6
    @State private var screenWidth: CGFloat = UIScreen.main.bounds.width
    private var rectangleWidth: CGFloat {
        screenWidth / 1.5 
    }
    private let rectangleHeight: CGFloat = 236

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<self.numberOfRectangles) { index in
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: self.rectangleWidth, height: self.rectangleHeight)
                            .scaleEffect(self.scale(for: index))
                            .zIndex(self.zIndex(for: index))
                    }
                }
            }
            .onAppear {
                self.screenWidth = geometry.size.width
            }
        }
    }

    func scale(for index: Int) -> CGFloat {
        let maxScale: CGFloat = 1.0
        let minScale: CGFloat = 0.8
        let scaleFactor = max(minScale, maxScale - CGFloat(abs(numberOfRectangles / 2 - index)) * 0.1)
        return scaleFactor
    }

    func zIndex(for index: Int) -> Double {
        return Double(-abs(numberOfRectangles / 2 - index))
    }
}

struct SomeView_Previews: PreviewProvider {
    static var previews: some View {
        SomeView()
    }
}


