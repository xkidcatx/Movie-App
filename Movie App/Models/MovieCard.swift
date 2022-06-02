//
//  MovieCard.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import UIKit

struct CategoryMovie {
    let name: Categories
    let movies: [MovieCard]
    
//    static func getCategory() -> [CategoryMovie] {
//        var categories: [CategoryMovie] = []
//        categories = [
//            CategoryMovie(name: .trendingAll, movies: MovieCard.getFake()),
//            CategoryMovie(name: .tvPopular, movies: MovieCard.getFake()),
//            CategoryMovie(name: .tredingTv, movies: MovieCard.getFake()),
//            CategoryMovie(name: .trendingMovie, movies: MovieCard.getFake())
//        ]
//        return categories
//    }
}

struct MovieCard {
    let name: String?
    let posterString: String?
    let backdropString: String?
    let dateString: String?
//    let date: Date?
//    let year: String?
    let star: Double?
    let description: String?
//    let genre: String?
//    let continueVideo: String?
//    let acterList: [Actor]?
    var posterUrl: String? {
        guard posterString != nil else { return nil }
        return "https://image.tmdb.org/t/p/w500/" + (self.posterString ?? "")
    }
    var backdorURL: String? {
        guard backdropString != nil else { return nil }
        return "https://image.tmdb.org/t/p/w500/" + (self.backdropString ?? "")
    }
    var imagePoster: UIImage {
//        let urlString = "https://image.tmdb.org/t/p/w500/6JjfSchsU6daXk2AKX8EEBjO3Fm.jpg"
//        let url = URL(string: urlString)
//        guard let data = try? Data(contentsOf: url!) else {
//            return UIImage(named: "poster")!
//        }
//        return UIImage(data: data)!
        
        return UIImage(named: "poster")!
    }
    
    var imageBackdor: UIImage {
        
        return UIImage(named: "poster")!
    }
    
    init(name: String?, posterString: String, backdropString: String?, dateString: String?, star: Double?, description: String?) {
        self.name = name
        self.posterString = posterString
        self.backdropString = backdropString
        self.dateString = dateString
        self.star = star
        self.description = description
    }
    
    init(name: String) {
        self.name = name
//        self.date = nil
        posterString = nil
        backdropString = nil
        dateString = nil
//        year = nil
        star = nil
        description = nil
//        genre = nil
//        continueVideo = nil
//        acterList = nil
    }
    
    static func getFake() -> [MovieCard] {
        var movies: [MovieCard] = []
        movies = [
            MovieCard(name: "Wonder Women"),
            MovieCard(name: "Betmen"),
            MovieCard(name: "Spider-Man"),
            MovieCard(name: "Men in Black"),
            MovieCard(name: "Halo"),
            MovieCard(name: "Star Wars"),
            MovieCard(name: "Alfa")
        ]
        return movies
    }
}

struct Actor {
    let name: String
    let character: String
    let imageData: Data?
    
    var image: UIImage {
        let image = imageData != nil ? UIImage(data: imageData!)! : UIImage(named: "poster")!
        return image
    }
}
