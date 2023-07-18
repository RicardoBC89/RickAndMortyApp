//
//  RMLocationListView.swift
//  RickAndMortyApp
//
//  Created by User on 17/07/23.
//

import UIKit
protocol RMLocationListViewDelegate: AnyObject {
    func rmLocationListView(_ locationListView: RMLocationListView,
                            didSelectLocation location: RMLocation
    )
}

final class RMLocationListView: UIView {
    
    public weak var delegate: RMLocationListViewDelegate?
    private let viewModel = RMLocationListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMLocationCollectionViewCell.self, forCellWithReuseIdentifier: RMLocationCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView, spinner)
        addSpinnerConstraints()
        addCollectionViewConstraints()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchLocations()
        setUpCollectionView()
    }
 
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addSpinnerConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func addCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
}

extension RMLocationListView: RMLocationListViewViewModelDelegate {
   
    func didSelectLocation(_ location: RMLocation) {
        delegate?.rmLocationListView(self, didSelectLocation: location)
    }
    
    func didLoadInicialLocation() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
        }
    }
}

