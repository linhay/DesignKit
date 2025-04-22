//
//  File.swift
//  DesignKit
//
//  Created by linhey on 4/18/25.
//

import SwiftUI

public extension EnvironmentValues {
    @Entry var dismissAction: (() -> Void)? = nil
    @Entry var foregroundColor: Color? = nil
    @Entry var backgroundColor: Color? = nil
}
