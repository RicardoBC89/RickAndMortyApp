//
//  RMLocationViewViewModel.swift
//  RickAndMortyApp
//
//  Created by User on 17/07/23.

import UIKit

protocol RMLocationListViewViewModelDelegate: AnyObject {
    func didLoadInicialLocation()
    func didSelectLocation(_ location: RMLocation)
}

final class RMLocationListViewViewModel: NSObject {
    
    public weak var delegate: RMLocationListViewViewModelDelegate?
    
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let viewModel = RMLocationCollectionViewCellViewModel(
                    locationName: location.name,
                    locationType: location.type,
                    locatinDimension: location.dimension)
                cellViewModels.append(viewModel)
            }
        }
    }
    private var cellViewModels: [RMLocationCollectionViewCellViewModel] = []
    
    private var apiInfo: RMGetAllLocationResponse.Info? = nil
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationRequest, expecting: RMGetAllLocationResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.locations = results
                self?.apiInfo = info
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMLocationListViewViewModel: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMLocationCollectionViewCell.cellIdentifier, for: indexPath) as? RMLocationCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
}

extension RMLocationListViewViewModel: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = bounds.width
        return CGSize(
            width: width,
            height: width
        )
    }
}
