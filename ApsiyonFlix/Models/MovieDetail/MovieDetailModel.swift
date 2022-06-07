//
//  MovieDetailModel.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import Foundation

// MARK: - MovieDetailModel
struct MovieDetailModel: Codable {
    let imdbID, originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case imdbID = "imdb_id"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case voteAverage = "vote_average"
    }
}
