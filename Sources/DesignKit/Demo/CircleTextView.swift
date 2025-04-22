//
//  SwiftUIView.swift
//  DesignKit
//
//  Created by linhey on 4/18/25.
//

/// https://www.youtube.com/watch?v=SRsX4Zyf7U8&t=112s
import SwiftUI
struct CircleTextView: View {
    // MARK: - Variables
    @State var viewAppeared = false
    var needsRotation: Bool = false
    var rotationDegree: Double
    var text: String
    var textGap: CGFloat
    let fontSize: CGFloat = 18
    // MARK: - Views
    var body: some View {
        GeometryReader { geometry in
            ForEach(Array(text.enumerated()), id: \.offset) { ix, element in
                Text (String(element))
                    .font(.system(size: fontSize, weight: .bold))
                    .offset(y: -(geometry.size.width / 1.8 - textGap))
                    .rotationEffect(.degrees (Double (ix) / Double (text.count)) * 360)
            }
            .scaleEffect(viewAppeared ? 1 : 0.9)
            .animation(.smooth(duration: 2.25).repeatForever(autoreverses: true), value: viewAppeared)
            .rotationEffect(.degrees (Double(rotationDegree) / Double(text.count)) * 360)
            .offset(x: geometry.size.width / 2 - fontSize / 2, y: geometry.size.height / 2 - fontSize / 2)
        }
    }
    
}

#Preview {
    CircleTextView(needsRotation: false,
                   rotationDegree: 2,
                   text: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                   textGap: 4)
    .padding(48)
}
