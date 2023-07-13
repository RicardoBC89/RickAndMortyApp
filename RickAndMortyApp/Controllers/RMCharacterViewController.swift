//
//  RMCharactersViewController.swift
//  RickAndMortyApp
//
//  Created by User on 04/07/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    private let charcterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Character"
        view.addSubview(charcterListView)
        setUpSubview()
        
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharacterResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total ", String(model.info.count))
                print("Page number ", String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
//        let request = RMRequest(endpoint: .character, queryParameters: [URLQueryItem(name: "name", value: "rick"),
//             URLQueryItem(name: "status", value: "alive")])
//        
//        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
//            switch result {
//            case .success:
//                break
//            case .failure(let error):
//                print(String(describing: error))
//            }
//        }
    }

    
    private func setUpSubview() {
        NSLayoutConstraint.activate([
            charcterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charcterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            charcterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            charcterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}
