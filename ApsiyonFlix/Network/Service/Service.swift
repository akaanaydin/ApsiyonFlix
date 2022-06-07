//
//  Service.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import Foundation
import Alamofire

//MARK: - Services Protocol
protocol ServicesProtocol {
    // Movie Functions
    func fetchPopularMovies(page: Int, onSuccess: @escaping (MovieModel?) -> Void, onError: @escaping (AFError) -> Void)
    func getMovieDetail(movieID: Int, onSuccess: @escaping (MovieDetailModel?) -> Void, onError: @escaping (AFError) -> Void)
    // Tv Show Functions
    func fetchPopularTvShows(page: Int, onSuccess: @escaping (TvShowModel?) -> Void, onError: @escaping (AFError) -> Void)
    func getTvShowDetail(tvShowID: Int, onSuccess: @escaping (TvShowDetailModel?) -> Void, onError: @escaping (AFError) -> Void)
}

//MARK: - Services
final class Services: ServicesProtocol {
    // Fetch Popular Movies
    func fetchPopularMovies(page: Int, onSuccess: @escaping (MovieModel?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.MovieServiceEndPoint.fetchMovies() + "&page=\(page)") { (response: MovieModel) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
    // Get Movie Detail
    func getMovieDetail(movieID: Int, onSuccess: @escaping (MovieDetailModel?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.MovieServiceEndPoint.fetchMovieDetail(movieID: movieID)) { (response: MovieDetailModel) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
    // Fetch Popular Tv Shows
    func fetchPopularTvShows(page: Int, onSuccess: @escaping (TvShowModel?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.MovieServiceEndPoint.fetchTvShows() + "&page=\(page)") { (response: TvShowModel) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
    // Get Tv Show Detail
    func getTvShowDetail(tvShowID: Int, onSuccess: @escaping (TvShowDetailModel?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.MovieServiceEndPoint.fetchTvShowDetail(tvShowID: tvShowID)) { (response: TvShowDetailModel) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
}
