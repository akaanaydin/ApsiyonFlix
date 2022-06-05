//
//  TvShowModel.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import Foundation

// MARK: - TvShowModel
struct TvShowModel: Codable {
    let page: Int?
    let results: [TvShowResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - TvShowResult
struct TvShowResult: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
