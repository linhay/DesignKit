//
//  ObservableView.swift
//  DesignKit
//
//  Created by linhey on 4/16/25.
//

import SwiftUI

public struct ObservableView<Content: View, Store>: View {
    
    @State public var store: Store
    public var content: (_ store: Store) -> Content
    
    public init(store: Store, @ViewBuilder content: @escaping (_: Store) -> Content) {
        self.store = store
        self.content = content
    }
    
    public var body: some View {
        content(store)
    }
    
}
