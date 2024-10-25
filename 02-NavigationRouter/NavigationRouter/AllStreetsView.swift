//
//  AllStreetsView.swift
//  NavigationRouter
//
//  Created on 25/10/2024
//
//  Copyright © 2024 Alfonsoft BV. All rights reserved.
//

import SwiftUI

struct AllStreetsView: View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        ForEach(Router.Street.allCases) { street in
            Button {
                router.navigate(to: street)
            } label: {
                Text(street.rawValue)
                    .frame(minWidth: 200)
            }
            .buttonStyle(.ghost)
        }
    }
}

#Preview {
    AllStreetsView()
}
