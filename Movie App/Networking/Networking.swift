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

class Networking {
    
    static var shared = Networking()
    private let session: URLSession = .shared
    
    let movieUrl = "https://api.themoviedb.org/3"
    
    private let key = "?api_key=3180eef08dadb9ca352d50241ce95409"
    
    private let language = "&language=ru"
    
    public let credits = "credits"
    
    func performRequest(category: Categories, completion: @escaping (CategoryMovie) -> Void)  {
        
        let fullUrl: String
        switch category {
        case .trendingAllDay: fullUrl = movieUrl + "/trending/all/day" + key + language
        case .trendingAllWeek: fullUrl = movieUrl + "/trending/all/week" + key + language
        case .trendingMovieDay: fullUrl = movieUrl + "/trending/movie/day" + key + language
        case .trendingMovieWeek: fullUrl = movieUrl + "/trending/movie/week" + key + language
            //        case .tvPopular: fullUrl = movieUrl + "/tv/popular" + key
            //        case .tredingTv: fullUrl = movieUrl + "/trending/tv/week" + key
        }
        
        guard let url = URL(string: fullUrl) else { return }
        print(url)
        
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil {
                print("Error response, \(String(describing: error))")
                return
            }
            guard let safeData = data else { return }
            guard let movieCategory = self.parseJSON(safeData, category) else { return }
            completion(movieCategory)
        }
        
        task.resume()
    }
    
    enum ParseActorsError: Error {
        case fetchData(message: String)
        case error(Error)
        case parseError(Error)
    }
    
    func fetchActors(at moveId: Int, type: MediaType, completion: @escaping (Swift.Result<[Actor], ParseActorsError>) -> Void) {
        let url: URL? = .init(string: movieUrl + "/\(type.rawValue)/" + "\(moveId)/" + credits + key + language)
        guard let url = url else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            let task = self.session.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(ParseActorsError.error(error)))
                    return
                }
                guard let data = data else {
                    completion(.failure(ParseActorsError.fetchData(message: "Нет даты")))
                    return
                }
                do {
                    let decoder: JSONDecoder = .init()
                    let actors = try decoder.decode(Actors.self, from: data)
                    completion(.success(actors.cast))
                } catch let error as NSError {
                    completion(.failure(ParseActorsError.parseError(error)))
                }
                
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(_ movieData: Data, _ category: Categories) -> CategoryMovie? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(MovieList.self, from: movieData)
            let movieList = decodeData.results
            var movies: [MovieCard] = []
            for movie in movieList {
                let newMovie = MovieCard(
                    id: movie.id, name: movie.name ?? movie.title,
                    posterString: movie.posterPath,
                    backdropString: movie.backdropPath,
                    dateString: movie.releaseDate ?? movie.firstAirDate,
                    star: movie.voteAverage,
                    description: movie.overview,
                    type: movie.mediaType
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

