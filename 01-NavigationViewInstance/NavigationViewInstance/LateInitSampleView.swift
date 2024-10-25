//
//  LateInitSampleView.swift
//  NavigationViewInstance
//
//  Created on 24/10/2024.
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//

import SwiftUI
import ASCommon

struct LateInitSampleView: View {
    @Binding var currentView: CurrentView
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ASLogoView {
                Spacer()
                Text("Navigation Demo")
                    .font(.title)
                Text("using NavigationPath")
                Text("This is the main View")
                Button {
                    print("Button tapped")
                    path.append("subview")
                } label: {
                    Text("Navigate to subview")
                }
                .buttonStyle(.ghost)
                Spacer()
                Button {
                    currentView = .select
                } label: {
                    Text("Home")
                }
                .buttonStyle(.ghost)
                .tint(.alfonsoftOrange)
                .padding(.bottom, 40)
            }
            .font(.title2)
            .navigationDestination(for: String.self) { name in
                if name == "subview" {
                    SubView()
                }
            }
        }
    }
}

#Preview {
    LateInitSampleView(currentView: .constant(.lateInit))
}
