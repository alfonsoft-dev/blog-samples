//
//  ErrorView.swift
//  NavigationRouter
//
//  Created on 25/10/2024
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(.red)
            Text(text)
        }
    }
}

#Preview {
    ErrorView(text: "Navigation failed")
}
