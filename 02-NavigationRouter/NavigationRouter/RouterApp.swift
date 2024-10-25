//
//  RouterApp.swift
//  BlogSamples
//
//  Created by Joris Windmolders on 24/10/2024.
//

import Foundation
import SwiftUI

//@main
struct RouterApp: App {
    @State private var router = Router()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .environment(router)
    }
}
