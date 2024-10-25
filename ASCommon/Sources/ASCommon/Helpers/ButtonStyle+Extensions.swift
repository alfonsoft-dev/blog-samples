//
//  ButtonStyle+Extensions.swift
//  ASCommon
//
//  Created on 24/10/2024.
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//

import Foundation
import SwiftUI

public struct GhostButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .foregroundStyle(.tint)
            .background(
                RoundedRectangle(
                    cornerRadius: 15,
                    style: .continuous
                )
                .stroke(.tint, lineWidth: 2)
            )
    }
}

public extension ButtonStyle where Self == GhostButtonStyle {
    static var ghost: Self {
        return .init()
    }
}
