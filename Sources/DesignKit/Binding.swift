//
//  Binding.swift
//  DesignKit
//
//  Created by linhey on 4/17/25.
//

import SwiftUI

public extension Binding where Value: Equatable & Sendable {
    init(_ optional: Binding<Value?>, replacingNilWith defaultValue: Value) {
        self.init(
            get: { optional.wrappedValue ?? defaultValue },
            set: { optional.wrappedValue = $0 }
        )
    }
}
