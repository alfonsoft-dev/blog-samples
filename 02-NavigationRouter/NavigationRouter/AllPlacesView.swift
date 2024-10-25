//
//  AllPlacesView.swift
//  NavigationRouter
//
//  Created on 25/10/2024
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//

import SwiftUI
import ASCommon

struct AllPlacesView: View {
    @Environment(Router.self) private var router
    
    let layout = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    
    
    var body: some View {
        LazyVGrid(columns: layout) {
            ForEach(Router.Place.allCases) { place in
                Button {
                    router.navigate(to: place)
                } label: {
                    Text(place.rawValue)
                        .frame(minWidth: 120)
                }
                .buttonStyle(.ghost)
                .tint(Color.alfonsoftOrange)
            }
        }
    }
}

#Preview {
    AllPlacesView()
}
