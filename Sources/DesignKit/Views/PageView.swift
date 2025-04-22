//
//  PageView.swift
//  TESD
//
//  Created by linhey on 11/5/24.
//

import SwiftUI

@Observable
public class PageReducer: Reducer, Identifiable {
    
    public var selection: Int
    public var items: [PageItemReducer]
    public var dragOffset: CGSize = .zero
    public var bgOpacity: Double = 1.0
    
    public init(selection: Int, items: [PageItemReducer]) {
        let previews = [selection - 1, selection, selection + 1]
        items.enumerated().forEach({ (offset, item) in
            item.isPreview = previews.contains(offset)
            item.isSelected = offset == selection
            item.id = offset
        })
        self.selection = selection
        self.items = items
    }
    
    public func clear() {
        self.items.removeAll()
    }
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
}

public struct PageView<Content: View>: View {
    
    @State var store: PageReducer
    @State var frame: CGRect = .zero
    @Binding var selection: Int
    @Environment(\.dismiss) var dismiss
    @Environment(\.dismissAction) var dismissAction
    let content: (_ store: PageItemReducer) -> Content

    public init(selection: Binding<Int>,
                store: PageReducer,
                content: @escaping (_ store: PageItemReducer) -> Content) {
        self.store = store
        self._selection = selection
        self.content = content
        
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(store.bgOpacity)
                .ignoresSafeArea()
                .update(frame: $frame, in: .global)
            GeometryReader { proxy in
                TabView(selection: $selection) {
                    ForEach(store.items, id: \.id) { item in
                        PageItemView(store: item, content: content)
                            .ignoresSafeArea()
                            .tag(item.id)
                            .padding(.trailing, 16)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(width: proxy.size.width + 16)
            }
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
            .onChange(of: selection) { old, new in
                store.selection = new
                store.items[new].isPreview = true
                if (new + 1) < store.items.count {
                    store.items[new + 1].isPreview = true
                }
                if new > 0 {
                    store.items[new - 1].isPreview = true
                }
            }
        }
        .presentationBackground(.clear)
    }
    
    func close() {
        if let dismissAction {
            withAnimation(.spring()) {
                dismissAction()
            } completion: {
                store.clear()
            }
        } else {
            dismiss()
            store.clear()
        }
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged({ value in
                let translation = value.translation
            let newOffset  = CGSize(width: translation.width, height: translation.height)
            let newOpacity = min(1.0, max(0.5, 1 - abs(newOffset.height) / 300))
            store.dragOffset = newOffset
            store.bgOpacity = newOpacity
        })
        .onEnded({ value in
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
    
    return PageView(selection: $selection, store: store) { store in
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
