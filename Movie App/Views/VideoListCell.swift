//
//  VideoListCell.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import UIKit

protocol EventsCell: AnyObject {
    func didClick(movie: MovieCard)
}

class VideoListCell: UITableViewCell {
    
    static let identifier = "VideoListCell"
    
    weak var cellDelegate: EventsCell?
    
    private var movies: [MovieCard] = []
     
    private let nameLabel: UILabel = {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "deepBlueColor")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
 
        setDelegates()
        setupViews()
        setConstraints()
    
    }
    
    private func setDelegates() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }
    
    private func setupViews() {
        backgroundColor = UIColor(named: "deepBlueColor")
        myCollectionView.register(
            CollectionViewCell.self,
            forCellWithReuseIdentifier: CollectionViewCell.identifier
        )
        addSubview(nameLabel)
        contentView.addSubview(myCollectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ category: Categories, model: [MovieCard]) {
        nameLabel.text = category.rawValue
        movies = model
    }
        
}
    
// MARK: - UICollectionViewDelegateFlowLayout

extension VideoListCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.height)
    }
    
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension VideoListCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier,
            for: indexPath
        ) as! CollectionViewCell

        let model = movies[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tap collection \(indexPath.row)")
        cellDelegate?.didClick(movie: movies[indexPath.row])
        
    }
    
}

// MARK: - Set Constraints

extension VideoListCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            myCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}
