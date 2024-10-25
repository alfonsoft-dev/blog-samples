//
//  MainView.swift
//  BlogSamples
//
//  Created by Joris Windmolders on 24/10/2024.
//

import SwiftUI
import ASCommon

struct MainView: View {
    
    @Bindable var router: Router
    
    var body: some View {
        ASLogoView {
            NavigationStack(path: $router.path) {
                AllStreetsView()
                    .navigationDestination(for: Router.Street.self) { street in
                        DestinationView(destination: street.rawValue, kind: .street)
                    }
                    .navigationDestination(for: Router.Place.self) { place in
                        DestinationView(destination: place.rawValue, kind: .place)
                    }
            }
        }
    }
}

#Preview {
    MainView(router: Router())
}
