//
//  MovieModel.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import Foundation

// MARK: - MovieModel
struct MovieModel: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieResult
struct MovieResult: Codable {
    let id: Int?
    let title: String?
    let posterPath, releaseDate: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case title = "title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
