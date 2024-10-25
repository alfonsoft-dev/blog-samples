//
//  SwiftUIView.swift
//  ASCommon
//
//  Created on 24/10/2024.
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//

import SwiftUI

public struct ASLogoView<Content: View>: View {
    
    let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {        
        ZStack {
            Color(.alfonsoftBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                content()
                FooterView()
                    .padding(10)
            }
        }
    }
}
