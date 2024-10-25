//
//  DestinationView.swift
//  BlogSamples
//
//  Created by Joris Windmolders on 24/10/2024.
//

import SwiftUI
import ASCommon

struct DestinationView: View {
    @Environment(Router.self) private var router
    private var destination: String
    private var kind: Router.Kind
    
    init(destination: String, kind: Router.Kind) {
        self.destination = destination
        self.kind = kind
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: kind == .street ? "car.fill" : "house.fill")
                .resizable()
                .frame(width: 40, height: 40)
            Text("Welcome to")
                .font(.title)
            Text(destination)
                .fontWeight(.semibold)
                .font(.title)
            Spacer()
            AllStreetsView()
            AllPlacesView()
            Spacer()
            if let message = router.failureMessage  {
                ErrorView(text: message)
                    .padding(.bottom, 18)
            } else {
                Text("Select a destination")
                    .padding(.bottom, 18)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button {
            router.back()
        } label: {
            Image(systemName: "arrow.left")
        })
    }
}

#Preview {
    DestinationView(destination: "Destination", kind: .place)
}
