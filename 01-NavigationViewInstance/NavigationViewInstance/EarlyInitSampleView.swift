//
//  EarlyInitSampleView.swift
//  NavigationViewInstance
//
//  Created on 24/10/2024.
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//


import SwiftUI
import ASCommon

struct EarlyInitSampleView: View {
    @Binding var currentView: CurrentView
    private let printer = InitPrinter(text: "Creating MainView")
    @State private var isSubviewVisible = false

    var body: some View {
        NavigationStack {
            ASLogoView {
                Spacer()
                Text("Navigation Demo")
                    .font(.title)
                Text("using isVisible")
                Text("This is the main View")
                Button {
                    print("Button tapped")
                    isSubviewVisible.toggle()
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
            .navigationDestination(isPresented: $isSubviewVisible) {
                SubView()
            }
        }
        .font(.title2)
    }
}

#Preview {
    EarlyInitSampleView(currentView: .constant(.earlyInit))
}
