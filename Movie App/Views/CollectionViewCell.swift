//
//  CollectionViewCell.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "collectionCell"
    
    private let currentDate = Date()
    
    private let movieImgaView: UIImageView = {
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private let nameLabel: UILabel = {
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let dateLabel: UILabel = {
        $0.textColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        
        
        addSubview(movieImgaView)
        addSubview(nameLabel)
        addSubview(dateLabel)
        clipsToBounds = true
        movieImgaView.layer.cornerRadius = 15
    }
    
    func configure(model: MovieCard) {
        nameLabel.text = model.name
        dateLabel.text = model.dateString
        
        guard model.posterUrl != nil else { return }
        movieImgaView.downloaded(from: model.posterUrl!)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionViewCell {
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            movieImgaView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            movieImgaView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            movieImgaView.widthAnchor.constraint(equalToConstant: frame.width - 10),
            movieImgaView.heightAnchor.constraint(equalToConstant: 200),
            movieImgaView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
    }
    
}
