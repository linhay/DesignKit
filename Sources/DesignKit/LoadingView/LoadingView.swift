//
//  Loading.swift
//  FlowUp
//
//  Created by linhey on 4/4/25.
//

import SwiftUI

public struct LoadingView: View {
    
    @State private var rotationDegree: Double = 0
    @State private var baseSize: CGFloat = 40
    @State private var space: CGFloat = 40
    @State private var degreeOffset: CGFloat = 30
    @State private var foregroundStyles: [Color] = [
        Color.n9.opacity(0.5),
        Color.n9.opacity(0.7),
        Color.n9.opacity(0.9)
    ]
    
    public init() {
        
    }
    
    public var body: some View {
        ZStack {
            ForEach(0...2, id: \.self) { zIndex in
                let zIndex = CGFloat(zIndex)
                ZStack {
                    ForEach(0...2, id: \.self) { index in
                        let index = Double(index)
                        let zIndex = Double(zIndex)
                        ArcShape(startAngle: .degrees(60 * index * 2 + degreeOffset * zIndex),
                                 endAngle: .degrees(60 * (2 * index + 1) + degreeOffset * zIndex))
                        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    }
                }
                .foregroundStyle(foregroundStyles[Int(zIndex)])
                .rotationEffect(.degrees(rotationDegree * (zIndex + 1)))
                .frame(width: baseSize + zIndex * space, height: baseSize + zIndex * space)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: false)) {
                rotationDegree = 360
            } completion: {
                degreeOffset += 10
            }
        }
    }
}


#Preview {
    ZStack {
        Color.bg1
        LoadingView()
    }
    .ignoresSafeArea()
    
}
