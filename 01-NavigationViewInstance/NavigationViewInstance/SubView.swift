//
//  SubView.swift
//  BlogSamples
//
//  Created on 23/10/2024.
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//

import SwiftUI
import ASCommon

struct SubView: View {
    private let printer = InitPrinter(text: "Creating SubView")
    
    var body: some View {
        ASLogoView {
            Spacer()
            Text("This is a Subview")
            InitPrinterView()
            Spacer()
        }
        .font(.title2)
    }
}

