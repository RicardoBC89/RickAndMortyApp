//
//  RMLocationCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by User on 17/07/23.
//

import UIKit

class RMLocationCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "RMLocationCollectionViewCell"
    
    private let locationNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationDimensionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray4
        contentView.addSubviews(locationNameLabel, locationTypeLabel, locationDimensionLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            locationNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            locationNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            locationNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            locationNameLabel.heightAnchor.constraint(equalToConstant: 40),
            locationTypeLabel.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor, constant: 15),
            locationTypeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            locationTypeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            locationTypeLabel.heightAnchor.constraint(equalToConstant: 40),
            locationDimensionLabel.topAnchor.constraint(equalTo: locationTypeLabel.bottomAnchor, constant: 15),
            locationDimensionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            locationDimensionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            locationDimensionLabel.heightAnchor.constraint(equalToConstant: 40)])
        locationNameLabel.backgroundColor = .orange
        locationTypeLabel.backgroundColor = .blue
        locationDimensionLabel.backgroundColor = .red
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        locationNameLabel.text = nil
        locationTypeLabel.text = nil
        locationDimensionLabel.text = nil
    }
    
    public func configure(with viewModel: RMLocationCollectionViewCellViewModel) {
        locationNameLabel.text = viewModel.locationName
        locationTypeLabel.text = viewModel.locationType
        locationDimensionLabel.text = viewModel.locationDimension
    }
}

