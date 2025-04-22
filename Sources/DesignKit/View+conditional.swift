//
//  View+IF.swift
//  FlowUp
//
//  Created by linhey on 2/10/25.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func `if`(_ conditional: Bool, @ViewBuilder content: (_ view: Self) -> some View) -> some View {
        modifier { view in
            if conditional {
                content(view)
            } else {
                view
            }
        }
    }
    
    @ViewBuilder
    func ifLet<Value>(_ conditional: Value?,
                      @ViewBuilder content: (_ view: Self, _ value: Value) -> some View,
                      @ViewBuilder else: ((_ view: Self) -> some View)) -> some View {
        modifier { view in
            if let conditional = conditional {
                content(view, conditional)
            } else {
                `else`(view)
            }
        }
    }
    
    @ViewBuilder
    func modifier(@ViewBuilder _ content: (_ view: Self) -> some View) -> some View {
        content(self)
    }
    
}

extension View {
    
    @ViewBuilder
    func update(frame: @escaping (_ value: CGRect) -> Void,
                in space: CoordinateSpaceProtocol) -> some View {
//        if #available(iOS 18.0, *) {
//            self.onGeometryChange(for: CGRect.self) { proxy in
//                proxy.frame(in: space)
//            } action: { oldValue, newValue in
//                frame(newValue)
//            }
//        } else if #available(iOS 17.0, *) {
//            self.onGeometryChange(for: CGRect.self) { proxy in
//                proxy.frame(in: space)
//            } action: { newValue in
//                frame(newValue)
//            }
//        } else {
            self.background(
                GeometryReader { proxy in
                    let newValue = proxy.frame(in: space)
                    Color.clear
                        .onAppear {
                            // 仅在元素出现时更新一次
                            frame(proxy.frame(in: space))
                        }
                        .task(id: newValue) {
                            frame(newValue)
                        }
                }
            )
//        }
    }
    
    @ViewBuilder
    func update(frame: Binding<CGRect>, in space: CoordinateSpaceProtocol) -> some View {
        update(frame: { value in
            frame.wrappedValue = value
        }, in: space)
    }
    
    @ViewBuilder
    func update(size: Binding<CGSize>) -> some View {
        if #available(iOS 18.0, *) {
            self.onGeometryChange(for: CGSize.self) { proxy in
                proxy.size
            } action: { oldValue, newValue in
                size.wrappedValue = newValue
            }
        } else if #available(iOS 17.0, *) {
            self.onGeometryChange(for: CGSize.self) { proxy in
                proxy.size

            } action: { newValue in
                size.wrappedValue = newValue
            }
        } else {
            self.background(
                GeometryReader { proxy in
                    let newValue = proxy.size
                    Color.clear
                        .task(id: newValue) { size.wrappedValue = newValue }
                }
            )
        }
    }
    
}

    
