//
//  NetworkConstant.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import Foundation

extension Constant {
// MARK: - Network Constant
    class NetworkConstant{
        
        enum MovieServiceEndPoint: String {
            
        case BASE_URL = "https://api.themoviedb.org"
        case API_KEY = "bd7847090fea4f76f5ce0c22bd1a85b8"
        case IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w1280"
            
            static func fetchMovies() -> String {
                "\(BASE_URL.rawValue)/3/movie/popular?api_key=\(API_KEY.rawValue)"
            }
            
            static func fetchMovieDetail(movieID: Int) -> String {
                "\(BASE_URL.rawValue)/3/movie/\(movieID)?api_key=\(API_KEY.rawValue)"
            }
            
            static func fetchTvShows() -> String {
                "\(BASE_URL.rawValue)/3/tv/popular?api_key=\(API_KEY.rawValue)"
            }
            
            static func fetchTvShowDetail(tvShowID: Int) -> String {
                "\(BASE_URL.rawValue)/3/tv/\(tvShowID)?api_key=\(API_KEY.rawValue)"
            }
            
        }
    }
}

//MOVIE
//https://api.themoviedb.org/3/movie/popular?api_key=bd7847090fea4f76f5ce0c22bd1a85b8
//https://api.themoviedb.org/3/movie/338953?api_key=bd7847090fea4f76f5ce0c22bd1a85b8
//TV SHOW
//https://api.themoviedb.org/3/tv/popular?api_key=bd7847090fea4f76f5ce0c22bd1a85b8
//https://api.themoviedb.org/3/tv/66732?api_key=bd7847090fea4f76f5ce0c22bd1a85b8
