//
//  RMLocationColletcionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by User on 17/07/23.
//

import Foundation

final class RMLocationCollectionViewCellViewModel {
    public let locationName: String
    public let locationType: String
    public let locationDimension: String
    
    init (locationName: String, locationType: String, locatinDimension: String) {
        self.locationName = locationName
        self.locationType = locationType
        self.locationDimension = locatinDimension
    }
}
