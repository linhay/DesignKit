//
//  PageView.swift
//  TESD
//
//  Created by linhey on 11/5/24.
//

import SwiftUI
import Combine

@Observable
open class PageReducer<Element>: Reducer, Identifiable {
    
    public let selectionSubject: CurrentValueSubject<Int, Never>
    public var selection: Int {
        didSet {
            selectionSubject.send(selection)
            debugPrint("[page] selection \(selection)")
        }
    }
    public var items: [Element]
    public var dragOffset: CGSize = .zero
    public var bgOpacity: Double = 1.0
    
    public init(selection: Int, items: [Element]) {
        selectionSubject = .init(selection)
        self.selection = selection
        self.items = items
    }
    
    deinit {
        debugPrint("[page] deinit \(self)")
    }
    
}

public struct PageView<Element, Content: View>: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var store: PageReducer<Element>
    @State var frame: CGRect = .zero
    @State private var isDragging = false
    
    let content: (_ store: Element) -> Content
    
    public init(store: PageReducer<Element>,
                content: @escaping (_ store: Element) -> Content) {
        self.store = store
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            Color.n9.opacity(store.bgOpacity)
                .ignoresSafeArea()
                .update(frame: $frame, in: .global)
            TabView(selection: $store.selection) {
                ForEach((0..<store.items.count), id: \.self) { idx in
                    ZStack {
                        Color.n9
                        content(store.items[idx])
                    }
                    .ignoresSafeArea()
                    .tag(idx)
                }
            }
            .ignoresSafeArea()
            .tabViewStyle(.page(indexDisplayMode: .never))
            .offset(x: store.dragOffset.width, y: store.dragOffset.height)
            .gesture(dragGesture)
            VStack {
                HStack {
                    Button(action: close) {
                        Image(systemName: "xmark")
                            .frame(width: 44, height: 44)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                .padding(.bottom, 8)
                .padding(.horizontal, 12)
                Spacer()
            }
            .toolbar(.hidden, for: .navigationBar)
            .opacity(store.bgOpacity)
        }
        .presentationBackground(.clear)
    }
    
    func close() {
        dismiss()
    }
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 50)
            .onChanged({ value in
                let translation = value.translation
                let newOffset  = CGSize(width: translation.width, height: translation.height)
                let newOpacity = min(1.0, max(0.5, 1 - abs(newOffset.height) / 300))
                store.dragOffset = newOffset
                store.bgOpacity = newOpacity
                if !isDragging {
                    isDragging = true
                }
            })
            .onEnded({ value in
                
                if isDragging {
                    isDragging = false
                }
                
                if value.location.y > frame.height / 2 {
                    withAnimation(.easeOut(duration: 0.3)) {
                        store.dragOffset = .init(width: 0, height: frame.height)
                        store.bgOpacity = 0
                    } completion: {
                        close()
                    }
                } else {
                    withAnimation(.easeOut(duration: 0.3)) {
                        store.dragOffset = .zero
                        store.bgOpacity = 1.0
                    }
                }
            })
    }
    
}

#Preview {
    @Previewable @State var selection = 0
    @Previewable @State var store = PageReducer(selection: 0, items: (0...100).map { index in
        PageItemReducer()
    })
    
    return PageView(store: store) { store in
        ZStack {
            Color.blue.opacity(store.id % 2 == 0 ? 1 : 0)
            Color.red.opacity(store.id % 2 != 0 ? 1 : 0)
        }
        .ignoresSafeArea()
        .overlay {
            Text("Page \(store.id) \(store.isSelected)")
        }
    }
}
