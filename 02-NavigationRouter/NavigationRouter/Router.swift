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
    
    enum Street: Hashable {
        case bakeryStreet
        case libraryAvenue
        case marketRoad
        case gardenLane
    }
    
    enum Place: Hashable {
        case bakeryBread
        case bakeryButter
        case centralLibrary
        case archiveCenter
        case freshMarket
        case fishStall
        case roseGarden
        case flowerNursery
    }
    
    var path = NavigationPath()
    private var currentStreet: Street?
    private var currentPlace: Place?
    
    func home() {
        self.currentStreet = nil
        self.currentPlace = nil
        self.path.removeLast(self.path.count)
    }
    
    func back() {
        guard self.currentStreet != nil else {
            return
        }

        self.path.removeLast()
    }
    
    func navigate(to street: Street) {
        guard isNavigationValid(to: street) else {
            return
        }
        
        self.currentStreet = street
        self.currentPlace = nil
        self.path.append(street)
    }
    
    func navigate(to place: Place) {
        guard isStreetNavigationValid(to: place)
                || isWalkNavigationValid(to: place)
        else {
            return
        }
        
        self.currentPlace = place
        self.path.append(place)
    }
    
    private func isNavigationValid(to destination: Street) -> Bool {
        guard let from = self.currentStreet else {
            return true
        }
        
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
        guard let street = currentStreet else {
            return false
        }
        
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
        guard let place = currentPlace else {
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
