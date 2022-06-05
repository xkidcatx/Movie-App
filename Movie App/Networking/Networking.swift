//
//  Networking.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import Foundation

enum Categories: String, CaseIterable {
    case trendingAllDay = "Популярное сегодня"
    case trendingAllWeek = "Популярное на этой неделе"
    case trendingMovieDay = "Популярное в кино сегодня"
    case trendingMovieWeek = "Популярное в кино на этой неделе"
    
//    case tvPopular = "Popular TV"
//    case tredingTv = "Trend TV in week"
    
//    static let allValues = [trendingAll, tvPopular, trendingMovie, tredingTv]
}

struct Networking {
    
    static var shared = Networking()
    
    static let movieUrl = "https://api.themoviedb.org/3"
    
    private let key = "?api_key=3180eef08dadb9ca352d50241ce95409"
    
    private let language = "&language=ru"
    
    func performRequest(category: Categories, completion: @escaping (CategoryMovie) -> Void)  {
        
        let fullUrl: String
        switch category {
        case .trendingAllDay: fullUrl = Networking.movieUrl + "/trending/all/day" + key + language
        case .trendingAllWeek: fullUrl = Networking.movieUrl + "/trending/all/week" + key + language
        case .trendingMovieDay: fullUrl = Networking.movieUrl + "/trending/movie/day" + key + language
        case .trendingMovieWeek: fullUrl = Networking.movieUrl + "/trending/movie/week" + key + language
//        case .tvPopular: fullUrl = movieUrl + "/tv/popular" + key
//        case .tredingTv: fullUrl = movieUrl + "/trending/tv/week" + key
        }
        
        guard let url = URL(string: fullUrl) else { return }
        print(url)
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Error response, \(String(describing: error))")
                return
            }
            guard let safeData = data else { return }
            guard let movieCategory = parseJSON(safeData, category) else { return }
            completion(movieCategory)
        }
        
        task.resume()
    }
    
    func parseJSON(_ movieData: Data, _ category: Categories) -> CategoryMovie? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(MovieList.self, from: movieData)
            let movieList = decodeData.results
            var movies: [MovieCard] = []
            for movie in movieList {
                let newMovie = MovieCard(
                    name: movie.name ?? movie.title,
                    posterString: movie.posterPath,
                    backdropString: movie.backdropPath,
                    dateString: movie.releaseDate ?? movie.firstAirDate,
                    star: movie.voteAverage,
                    description: movie.overview
                )
                movies.append(newMovie)
            }
            let categoryMovie = CategoryMovie(name: category, movies: movies)
            return categoryMovie
        } catch {
            print("Error with parse")
            return nil
        }
    }
}
