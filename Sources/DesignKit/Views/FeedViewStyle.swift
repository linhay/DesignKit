//
//  FeedView.swift
//  Feeder
//
//  Created by EVGENY SYSENKA on 08/04/2025.
//

import SwiftUI

public enum FeedViewStyle {
    case plain
    case rotation
    case cardFlip
}

public struct FeedView<Data, Content>: View where Data: RandomAccessCollection,
                                           Data.Element: Identifiable,
                                           Content: View {
    
    public typealias ContentClosure = (Data.Element) -> Content
    
    private let data: Data
    private let content: ContentClosure
    private let style: FeedViewStyle
    private let initialIndex: Int
    
    @Binding var pageIndex: Int
    @State var scrollViewPosition: Int?

    public init(
        data: Data,
        currentIndex: Binding<Int>,
        style: FeedViewStyle = .cardFlip,
        @ViewBuilder content: @escaping ContentClosure
    ) {
        self.data = data
        self.content = content
        self.style = style
        self.initialIndex = currentIndex.wrappedValue
        self._pageIndex = currentIndex
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(Array(data.enumerated()), id: \.0) { index, item in
                        content(item)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .trackScrollOffset(index: index)
                            .applyScrollTransitionStyle(style)
                            .id(index)
                    }
                }
            }
            .scrollPosition(id: $scrollViewPosition)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            .onIndexChange(geometry: geometry) { index in
                pageIndex = index
            }
            .task {
                scrollViewPosition = initialIndex
            }
        }
        .ignoresSafeArea()
    }
}

private extension View {
    
    @ViewBuilder
    func applyScrollTransitionStyle(_ style: FeedViewStyle) -> some View {
        switch style {
            case .plain:
                self.scrollTransition { content, phase in
                    content
                        .blur(radius: abs(phase.value) * 7)
                        .opacity(1 - abs(phase.value) * 0.25)
                }
                
            case .rotation:
                self.scrollTransition { content, phase in
                    content
                        .rotation3DEffect(
                            .degrees(-phase.value * 90),
                            axis: (x: 1, y: 0, z: 0),
                            anchor: UnitPoint(x: 0.5, y: 0.5 - phase.value * 0.5),
                            perspective: 1.5
                        )
                        .opacity(1 - abs(phase.value) * 0.25)
                }
            case .cardFlip:
                self.scrollTransition { content, phase in
                    content
                        .rotation3DEffect(
                            .degrees(-phase.value * 180),
                            axis: (x: 0, y: 1, z: 0),
                            anchor: .center
                        )
                        .opacity(1 - abs(phase.value) * 0.25)
                }
        }
        
    }
}
