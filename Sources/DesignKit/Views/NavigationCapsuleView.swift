//
//  SwiftUIView.swift
//  DesignKit
//
//  Created by linhey on 4/27/25.
//

import SwiftUI

public struct NavigationCapsuleView: View {
    
    public let text: String
    
    public init(_ text: String) {
        self.text = text
    }

    public var body: some View {
        Text(text)
            .font(.system(size: 12, weight: .medium))
            .padding(.horizontal, 12)
            .frame(height: 28)
            .background(Color.n9.opacity(0.6))
            .background(.regularMaterial)
            .foregroundStyle(Color.n1)
            .clipShape(Capsule())
            .contentShape(Rectangle())
            .colorScheme(.light)
    }
    
}

#Preview {
    NavigationStack {
        DynamicBackgroundView(.aurora)
            .ignoresSafeArea()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationCapsuleView("Hello")
                }
            }
    }
}
