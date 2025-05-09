//
//  PageItemReducer.swift
//  DesignKit
//
//  Created by linhey on 4/18/25.
//

import SwiftUI

@Observable
public class PageItemReducer: Reducer, Identifiable {
    
    public var id: Int = 0
    public var isSelected: Bool = false
    public var isPreview: Bool = false
    public var isZoomable = false
    
    public init() {}
    
}

struct PageItemView<Content: View>: View {
    
    @State var store: PageItemReducer
    let content: (_ store: PageItemReducer) -> Content
    
    var body: some View {
        ZStack {
            if store.isPreview {
                if store.isZoomable {
                    ZoomableScrollView {
                        content(store)
                    }
                } else {
                    content(store)
                }
            } else {
                Color.clear.ignoresSafeArea()
            }
        }
    }
    
}

#Preview {
    @Previewable @State var store = PageItemReducer()
    PageItemView(store: store) { store in
        ZStack {
            Color.blue.ignoresSafeArea()
            Text("Hello, \(store.id)")
        }
    }.onAppear {
        store.isSelected = true
    }
}
