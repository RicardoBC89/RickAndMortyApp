//
//  RMLocationViewController.swift
//  RickAndMortyApp
//
//  Created by User on 04/07/23.
//

import UIKit

final class RMLocationViewController: UIViewController, RMLocationListViewDelegate {
   
    private let locationListView = RMLocationListView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Location"
        view.addSubview(locationListView)
        locationListView.delegate = self
        setUpSubview()
    }
    
    private func setUpSubview() {
        NSLayoutConstraint.activate([
            locationListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            locationListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            locationListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            locationListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func rmLocationListView(_ locationListView: RMLocationListView, didSelectLocation location: RMLocation) {
        let viewModel = RMLocationDetailViewViewModel(location: location)
        let detailVC = RMLocationDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
