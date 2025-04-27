//
//  SwiftUIView.swift
//  DesignKit
//
//  Created by linhey on 4/21/25.
//

import SwiftUI
import ColorfulX

public struct DynamicBackgroundView: View {
    
    @State var color: SKColorfulPreset
    
    public init(_ color: SKColorfulPreset) {
        self.color = color
    }
    
    public var body: some View {
        ColorfulView.init(color: color)
    }
}

#Preview {
    DynamicBackgroundView(.ocean)
}
