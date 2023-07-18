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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
        contentView.backgroundColor = .systemGray4
        contentView.addSubviews(imageView, nameLabel, speciesLabel, statusLabel)
        addConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstrains() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 160),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 7),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 35),
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
        speciesLabel.text = viewModel.characterSpeciesText
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
