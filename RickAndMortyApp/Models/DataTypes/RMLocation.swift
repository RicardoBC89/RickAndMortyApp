//
//  RMLocation.swift
//  RickAndMortyApp
//
//  Created by User on 04/07/23.
//

import Foundation

struct RMLocation: Codable {
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
