//
//  RMService.swift
//  RickAndMortyApp
//
//  Created by User on 04/07/23.
// Responsible for the API calls

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {
    }
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
