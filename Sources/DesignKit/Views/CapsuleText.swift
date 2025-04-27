//
//  File.swift
//  DesignKit
//
//  Created by linhey on 4/20/25.
//

import SwiftUI

public struct CapsuleText: View {
    
    @Environment(\.foregroundColor) var foregroundColor
    @Environment(\.backgroundColor) var backgroundColor
    @Environment(\.backgroundGradient) var backgroundGradient
    public let text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.footnote)
            .padding(.horizontal, 12)
            .frame(height: 28)
            .foregroundStyle(foregroundColor ?? Color.n9)
            .background {
                if let backgroundColor {
                    backgroundColor
                } else if let backgroundGradient {
                    LinearGradient(gradient: .blue6_4,
                                   startPoint: .leading,
                                   endPoint: .trailing)
                } else {
                    Color.n1
                }
            }
            .clipShape(Capsule())
            .contentShape(Rectangle())
    }
}
