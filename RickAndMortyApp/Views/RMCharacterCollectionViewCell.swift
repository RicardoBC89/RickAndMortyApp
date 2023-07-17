//
//  RMCharacterCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by User on 13/07/23.
//

import UIKit

final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .systemCyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .systemCyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel, speciesLabel, statusLabel)
        addConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsuported")
    }
    
    private func addConstrains() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            speciesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            speciesLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            speciesLabel.heightAnchor.constraint(equalToConstant: 25),
            statusLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 3),
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            statusLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        speciesLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.characterName
        speciesLabel.text = viewModel.characterSpecies
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case . failure(let error):
                print(error)
                break
            }
        }
    }
}
