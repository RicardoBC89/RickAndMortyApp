//
//  RMCharacterStatus.swift
//  RickAndMortyApp
//
//  Created by User on 05/07/23.
//

import Foundation
import UIKit

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
