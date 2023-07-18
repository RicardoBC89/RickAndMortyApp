//
//  RMLocationDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by User on 17/07/23.
//

import Foundation

final class RMLocationDetailViewViewModel {
    private let location: RMLocation
    init(location: RMLocation) {
        self.location = location
    }
    
    public var title: String {
        location.name.uppercased()
    }
}
