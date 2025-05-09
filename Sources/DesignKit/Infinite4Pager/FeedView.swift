//
//  FeedView.swift
//  Feeder
//
//  Created by EVGENY SYSENKA on 08/04/2025.
//

import SwiftUI

public struct FeedView<Data, Content>: View where Content: View {
    
    public typealias ContentClosure = (Data) -> Content
    private let list: [Data]
    private let content: ContentClosure
    private let direction: ScrollDirection
    @Binding var selection: Int
    
    public enum ScrollDirection {
        case horizontal
        case vertical
    }
    
    public init(direction: ScrollDirection = .vertical,
                selection: Binding<Int>,
                list: [Data],
                @ViewBuilder content: @escaping ContentClosure) {
        self.direction = direction
        self.list = list
        self.content = content
        self._selection = selection
    }
    
    public var body: some View {
        switch direction {
        case .vertical:
            Infinite4Pager(initialHorizontalPage: 0,
                           initialVerticalPage: selection,
                           totalHorizontalPage: 1,
                           totalVerticalPage: list.count,
                           enablePageVisibility: true) { (h, v) in
                if list.isEmpty {
                    Color.clear
                } else {
                    content(list[v])
                        .onPageVisible { flag in
                            if flag == 1 {
                                selection = v
                            }
                        }
                }
            }
        case .horizontal:
            Infinite4Pager(initialHorizontalPage: selection,
                           initialVerticalPage: 0,
                           totalHorizontalPage: list.count,
                           totalVerticalPage: 1,
                           enablePageVisibility: true) { (h, v) in
                if list.isEmpty {
                    Color.clear
                } else {
                    content(list[h])
                        .onPageVisible { flag in
                            if flag == 1 {
                                selection = h
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var items = Array(0...10)
    @Previewable @State var selection = 5
    
    ZStack {
        FeedView(selection: $selection, list: items) { idx in
            Rectangle()
                .fill(.red)
                .overlay {
                    Text(idx.description)
                }
        }
        .ignoresSafeArea()
    }
    .overlay(alignment: .topTrailing) {
        VStack {
            Text("Current Index: \(selection)")
        }
    }
}
