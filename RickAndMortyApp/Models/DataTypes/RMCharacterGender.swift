//
//  RMCharacterGender.swift
//  RickAndMortyApp
//
//  Created by User on 05/07/23.
//

import Foundation

enum RMCharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknwon = "unknown"
    
    var text: String {
        switch self {
        case .male, .female, .genderless:
            return rawValue
        case .unknwon:
            return "Unknown"
        }
    }
}
