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
    @Binding var selection: Int
    
    public init(selection: Binding<Int>,
                list: [Data],
                @ViewBuilder content: @escaping ContentClosure) {
        self.list = list
        self.content = content
        self._selection = selection
    }
    
    public var body: some View {
        Infinite4Pager(initialHorizontalPage: 0,
                       initialVerticalPage: selection,
                       totalHorizontalPage: 1,
                       totalVerticalPage: list.count,
                       enablePageVisibility: true) { (h, v) in
            content(list[v])
                .onPageVisible { flag in
                    if flag == 1 {
                        selection = v
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
