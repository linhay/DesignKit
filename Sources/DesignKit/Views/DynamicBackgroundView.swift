//
//  SwiftUIView.swift
//  DesignKit
//
//  Created by linhey on 4/21/25.
//

import SwiftUI
import ColorfulX

public struct DynamicBackgroundView: View {
    
    @Binding var color: SKColorfulPreset
    
    public init(_ color: SKColorfulPreset) {
        self._color = .constant(color)
    }
    
    public init(_ color: Binding<SKColorfulPreset>) {
        self._color = color
    }
    
    public var body: some View {
        ColorfulView(color: color)
    }
}

#Preview {
    DynamicBackgroundView(.ocean)
}
