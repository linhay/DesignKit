//
//  ArcShape.swift
//  DesignKit
//
//  Created by linhey on 4/24/25.
//

import SwiftUI

public struct ArcShape: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    public init(startAngle: Angle, endAngle: Angle, clockwise: Bool = false) {
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.clockwise = clockwise
    }
    
    public func path(in rect: CGRect) -> Path {
        
        var path = Path()
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: clockwise)
        
        return path
    }
}


#Preview {
    ZStack {
        ForEach(1..<4) { index in
            let index = CGFloat(index)
            ArcShape(startAngle: .degrees(0), endAngle: .degrees(90))
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: index * 100, height: index * 100)
                .padding()
        }
    }
}
