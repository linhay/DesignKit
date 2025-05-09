//
//  RoundedCorner.swift
//  DesignKit
//
//  Created by linhey on 4/29/25.
//

import SwiftUI

public struct RoundedCornerShape: Shape {
    
    var radius: CGFloat
    var corners: UIRectCorner
    
    public init(radius: CGFloat, corners: UIRectCorner) {
        self.radius = radius
        self.corners = corners
    }
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    RoundedCornerShape(radius: 10, corners: [.topLeft, .topRight])
        .fill(Color.blue)
        .frame(width: 200, height: 100)
}
