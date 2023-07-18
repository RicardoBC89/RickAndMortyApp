//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by User on 13/07/23.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {
    
    public let characterName: String
    private let characterSpecies: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterSpecies)
        hasher.combine(characterImageUrl)
    }
    
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
    init(
        characterName: String,
        characterSpecies: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterSpecies = characterSpecies
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterSpeciesText: String {
        return "Species: \(characterSpecies)"
    }
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void) {
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageManager.shared.donwloadImage(url, completion: completion)
    }
}
