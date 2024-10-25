//
//  ContentView.swift
//  NavigationViewInstance
//
//  Created on 24/10/2024.
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//


import SwiftUI
import ASCommon

enum CurrentView {
    case select
    case earlyInit
    case lateInit
}

struct ContentView: View {
    @State private var currentView = CurrentView.select
    
    var body: some View {
        switch(currentView) {
        case .select: SelectionView(currentView: $currentView)
        case .earlyInit: EarlyInitSampleView(currentView: $currentView)
        case .lateInit: LateInitSampleView(currentView: $currentView)
        }
    }
}

#Preview {
    ContentView()
}
