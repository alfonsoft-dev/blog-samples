//
//  InitPrinterView.swift
//  BlogSamples
//
//  Created on 23/10/2024.
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//


import SwiftUI

struct InitPrinterView: View {
    
    private let printer = InitPrinter(text: "Creating InitPrinterView")

    var body: some View {
        Text("InitPrinterView")
        Text("See XCode Debug Console")
    }
}

#Preview {
    InitPrinterView()
}
