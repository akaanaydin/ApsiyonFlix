//
//  TvShowDetailModel.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import Foundation


// MARK: - TvShowDetailModel
struct TvShowDetailModel: Codable {
    let name: String?
    let numberOfEpisodes, numberOfSeasons: Int?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
