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
    public let text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.footnote)
            .padding(.horizontal, 12)
            .frame(height: 28)
            .background(backgroundColor ?? Color.n1)
            .foregroundStyle(foregroundColor ?? Color.n9)
            .clipShape(Capsule())
            .contentShape(Rectangle())
    }
}
