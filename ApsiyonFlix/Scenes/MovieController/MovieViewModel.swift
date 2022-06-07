//
//  MovieViewModel.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import Foundation
import Alamofire

//MARK: - Protocols
protocol MovieViewModelProtocol{
    func fetchPopularMovies(page: Int, onSuccess: @escaping (MovieModel?) -> Void, onError: @escaping (AFError) -> Void)
    func getMovieDetail(movieID: Int, onSuccess: @escaping (MovieDetailModel?) -> Void, onError: @escaping (AFError) -> Void)
    var delegate: MovieOutput? { get set }
}


final class MovieViewModel: MovieViewModelProtocol {
    //MARK: - Properties
    var delegate: MovieOutput?
    private var service: ServicesProtocol
    //MARK: - Life Cycle
    init(service: ServicesProtocol) {
        self.service = service
    }
    
}

//MARK: - Extension Protocol Functions
extension MovieViewModel {
    func fetchPopularMovies(page: Int, onSuccess: @escaping (MovieModel?) -> Void, onError: @escaping (AFError) -> Void) {
        service.fetchPopularMovies(page: page) { movie in
            guard let movie = movie else {
                onSuccess(nil)
                return
            }
            onSuccess(movie)
        } onError: { error in
            onError(error)
        }
    }
    
    func getMovieDetail(movieID: Int, onSuccess: @escaping (MovieDetailModel?) -> Void, onError: @escaping (AFError) -> Void) {
        service.getMovieDetail(movieID: movieID) { movieDetail in
            guard let movieDetail = movieDetail else {
                onSuccess(nil)
                return
            }
            onSuccess(movieDetail)
        } onError: { error in
            onError(error)
        }
    }
}
