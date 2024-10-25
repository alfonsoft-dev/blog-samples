//
//  FooterView.swift
//  ASCommon
//
//  Created on 24/10/2024.
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//


import SwiftUI

public struct FooterView: View {
    
    public var body: some View {
        HStack(spacing: 0) {
            Spacer()
            Text("demo code by alfonsoft")
                .padding(.trailing, 0)
            Text(".dev")
                .padding(.leading, 0)
                .foregroundStyle(Color.alfonsoftYellow)
            Spacer()
        }
        .font(.caption)
    }
}

#Preview {
    FooterView()
}
