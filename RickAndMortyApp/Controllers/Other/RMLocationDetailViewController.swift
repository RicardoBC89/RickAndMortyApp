//
//  RMLocationDetailViewController.swift
//  RickAndMortyApp
//
//  Created by User on 18/07/23.
//

import UIKit

class RMLocationDetailViewController: UIViewController {

    private let viewModel: RMLocationDetailViewViewModel
    
    init(viewModel: RMLocationDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = viewModel.title
    }
}
