//
//  MovieData.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import UIKit

struct MovieList: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result

struct Movie: Codable {
    let backdropPath: String
    let genreIDS: [Int]
    let originalName: String?
    let originCountry: [String]?
    let posterPath: String
    let voteCount, id: Int
    let voteAverage: Double
    let overview: String
    let firstAirDate: String?
    let originalLanguage: OriginalLanguage
    let name: String?
    let popularity: Double
    let mediaType: MediaType
    let adult: Bool?
    let originalTitle, releaseDate, title: String?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalName = "original_name"
        case originCountry = "origin_country"
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case id
        case voteAverage = "vote_average"
        case overview
        case firstAirDate = "first_air_date"
        case originalLanguage = "original_language"
        case name, popularity
        case mediaType = "media_type"
        case adult
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case title, video
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
}
