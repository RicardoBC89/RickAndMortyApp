//
//  RMCharactersViewController.swift
//  RickAndMortyApp
//
//  Created by User on 04/07/23.
//

import UIKit

final class RMCharacterViewController: UIViewController, RMCharacterListViewDelegate {
    
    private let charcterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Character"
        view.addSubview(charcterListView)
        charcterListView.delegate = self
        setUpSubview()
        }

    private func setUpSubview() {
        NSLayoutConstraint.activate([
            charcterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charcterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            charcterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            charcterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
