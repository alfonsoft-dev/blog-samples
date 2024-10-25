//
//  Router.swift
//  BlogSamples
//
//  Created by Joris Windmolders on 24/10/2024.
//

import Foundation
import SwiftUI

@Observable
final class Router {
    
    enum Street: String, CaseIterable, Identifiable, Codable {
        var id: String {
            self.rawValue
        }
        
        case bakeryStreet = "bakeryStreet"
        case libraryAvenue = "libraryAvenue"
        case marketRoad = "marketRoad"
        case gardenLane = "gardenLane"
    }
    
    enum Place: String, CaseIterable, Identifiable, Hashable, Codable {
        var id: String {
            self.rawValue
        }

        case bakeryBread = "bakeryBread"
        case bakeryButter = "bakeryButter"
        case centralLibrary = "centralLibrary"
        case archiveCenter = "archiveCenter"
        case freshMarket = "freshMarket"
        case fishStall = "fishStall"
        case roseGarden = "roseGarden"
        case flowerNursery = "flowerNursery"
    }
    
    enum Kind {
        case street
        case place
    }
    
    var path = NavigationPath()
    var failureMessage: String?
    private var streetPath: [Street] = []
    private var placePath: [Place] = []
    private var kindPath: [Kind] = []
    
    func home() {
        self.streetPath = []
        self.placePath = []
        self.kindPath = []
        self.path.removeLast(self.path.count)
    }
    
    func back() {
        guard let kind = kindPath.last else {
            return
        }
        
        switch kind {
        case .street: self.streetPath.removeLast()
        case .place: self.placePath.removeLast()
        }

        self.path.removeLast()
        self.kindPath.removeLast()
    }
    
    func navigate(to street: Street) {
        guard isNavigationValid(to: street) else {
            self.failureMessage = "navigation to \(street.rawValue) failed"
            return
        }

        self.kindPath.append(.street)
        self.streetPath.append(street)
        self.path.append(street)
        self.failureMessage = nil
    }
    
    func navigate(to place: Place) {
        guard isStreetNavigationValid(to: place)
                || isWalkNavigationValid(to: place)
        else {
            self.failureMessage = "navigation to \(place.rawValue) failed"
            return
        }
        
        self.kindPath.append(.place)
        self.placePath.append(place)
        self.path.append(place)
        self.failureMessage = nil
    }
    
    private func isNavigationValid(to destination: Street) -> Bool {
        guard streetPath.count > 0 else {
            return true
        }
        
        let from = streetPath.last
        switch destination {
        case .bakeryStreet:
            return from == .gardenLane
        case .libraryAvenue:
            return from == .bakeryStreet
        case .marketRoad:
            return from == .libraryAvenue
        case .gardenLane:
            return from == .marketRoad
        }
    }
    
    private func isStreetNavigationValid(to destination: Place) -> Bool {
        guard streetPath.count > 0 else {
            return false // should navigate to street first
        }
        
        if let kind = kindPath.last,
           kind == .place,
           placePath.last == destination {
            return false // already at destination
        }
        
        let street = streetPath.last
        switch destination {
        case .bakeryBread, .bakeryButter:
            return street == .bakeryStreet
        case .centralLibrary, .archiveCenter:
            return street == .libraryAvenue
        case .freshMarket, .fishStall:
            return street == .marketRoad
        case .roseGarden, .flowerNursery:
            return street == .gardenLane
        }
    }
    
    private func isWalkNavigationValid(to destination: Place) -> Bool {
        guard placePath.count > 0 else {
            return false
        }
        
        switch destination {
        case .roseGarden:
            return [.centralLibrary, .fishStall].contains(destination)
        case .centralLibrary:
            return [.roseGarden, .fishStall].contains(destination)
        case .fishStall:
            return [.roseGarden, .centralLibrary].contains(destination)
        default: return false
        }
    }
    
}
