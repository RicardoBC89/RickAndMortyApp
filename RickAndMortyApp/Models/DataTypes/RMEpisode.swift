//
//  RMEpisodes.swift
//  RickAndMortyApp
//
//  Created by User on 04/07/23.
//

import Foundation

struct RMEpisode: Codable {
    
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let character: String
    let url: String
    let created: String
}
