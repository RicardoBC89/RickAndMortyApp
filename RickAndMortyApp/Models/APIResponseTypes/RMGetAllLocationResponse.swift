//
//  RMGetAllLocationResponse.swift
//  RickAndMortyApp
//
//  Created by User on 17/07/23.
//

import Foundation

struct RMGetAllLocationResponse: Codable {
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMLocation]
}
