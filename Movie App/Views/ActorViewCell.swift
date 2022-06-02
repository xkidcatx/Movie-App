//
//  ActorViewCell.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import UIKit

class ActorViewCell: UICollectionViewCell {
        
    private let actorImageView: UIImageView = {
        $0.image = UIImage(named: "tomHardy")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    
    private let actorNameLabel: UILabel = {
        $0.text = "Tom Hardy"
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 15)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let characterNameLabel: UILabel = {
        $0.text = "Bronson"
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Actor) {
        actorNameLabel.text = model.name
        characterNameLabel.text = model.character
    }
    
    private func setupViews() {
        backgroundColor = .none
        
        addSubview(actorImageView)
        addSubview(actorNameLabel)
        addSubview(characterNameLabel)
        clipsToBounds = true
        actorImageView.layer.cornerRadius = 20
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            actorImageView.topAnchor.constraint(equalTo: topAnchor),
            actorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            actorImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            actorImageView.widthAnchor.constraint(equalToConstant: 80),
            actorImageView.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        NSLayoutConstraint.activate([
            actorNameLabel.topAnchor.constraint(equalTo: actorImageView.bottomAnchor, constant: 5),
            actorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            actorNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(equalTo: actorNameLabel.bottomAnchor, constant: 5),
            characterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
        
        
    }
}
