//
//  RMCharacterListViewViewModel.swift
//  RickAndMortyApp
//
//  Created by User on 05/07/23.
//

import Foundation
import UIKit

final class RMCharacterListViewViewModel: NSObject {
    func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharacterResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total"+String(model.info.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green 
        return cell
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
}
