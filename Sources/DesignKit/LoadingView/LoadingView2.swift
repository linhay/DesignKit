//
//  Loading.swift
//  FlowUp
//
//  Created by linhey on 4/4/25.
//

import SwiftUI

public struct LoadingView2: View {
    
    @State private var rotationDegree: Double = 0
    @State private var baseSize: CGFloat = 88
    @State private var degreeOffset: CGFloat = 30
    
    let arcColor: Color
    let circleColor: Color
    
    public init(arcColor: Color = .n9, circleColor: Color = .n5) {
        self.arcColor = arcColor
        self.circleColor = circleColor
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round))
                .foregroundStyle(circleColor)
            ArcShape(startAngle: .degrees(0),
                     endAngle: .degrees(90))
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .foregroundStyle(arcColor)
        }
        .rotationEffect(.degrees(rotationDegree))
        .frame(idealWidth: baseSize, idealHeight: baseSize)
        .onAppear {
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                rotationDegree = 360
            }
        }
    }
}


#Preview {
    ZStack {
        Color.bg1
        LoadingView2()
    }
    .ignoresSafeArea()
    
}
