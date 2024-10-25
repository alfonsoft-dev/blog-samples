//
//  SelectionView.swift
//  NavigationViewInstance
//
//  Created on 24/10/2024.
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//

import SwiftUI
import ASCommon

struct SelectionView: View {
    
    @Binding var currentView: CurrentView

    @ViewBuilder
    var body: some View {
        ASLogoView {
            Spacer()
            Button {
                currentView = .earlyInit
            } label: {
                Text("Navigation Demo with isVisible")
            }
            .buttonStyle(.ghost)
            .padding(.bottom, 40)

            Button {
                currentView = .lateInit
            } label: {
                Text("Navigation Demo with NavigationPath")
            }
            .buttonStyle(.ghost)
            
            Spacer()
        }
        .font(.title2)
    }
}

#Preview {
    SelectionView(currentView: .constant(.select))
}
