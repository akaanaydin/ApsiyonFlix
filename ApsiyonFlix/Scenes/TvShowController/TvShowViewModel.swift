//
//  TvShowViewModel.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 6.06.2022.
//

import Foundation

import Foundation
import Alamofire

//MARK: - Protocols
protocol TvShowViewModelProtocol{
    func fetchPopularTvShows(page: Int, onSuccess: @escaping (TvShowModel?) -> Void, onError: @escaping (AFError) -> Void)
    func getTvShowDetail(tvShowID: Int, onSuccess: @escaping (TvShowDetailModel?) -> Void, onError: @escaping (AFError) -> Void)
    var delegate: TvShowOutput? { get set }
}


final class TvShowViewModel: TvShowViewModelProtocol {
    //MARK: - Properties
    var delegate: TvShowOutput?
    private var service: ServicesProtocol
    //MARK: - Life Cycle
    init(service: ServicesProtocol) {
        self.service = service
    }
    
}

//MARK: - Extension Protocol Functions
extension TvShowViewModel {
    
    func fetchPopularTvShows(page: Int, onSuccess: @escaping (TvShowModel?) -> Void, onError: @escaping (AFError) -> Void) {
        service.fetchPopularTvShows(page: page) { tvShow in
            guard let tvShow = tvShow else {
                onSuccess(nil)
                return
            }
            onSuccess(tvShow)
        } onError: { error in
            onError(error)
        }
    }
    
    func getTvShowDetail(tvShowID: Int, onSuccess: @escaping (TvShowDetailModel?) -> Void, onError: @escaping (AFError) -> Void) {
        service.getTvShowDetail(tvShowID: tvShowID) { tvShowDetail in
            guard let tvShowDetail = tvShowDetail else {
                onSuccess(nil)
                return
            }
            onSuccess(tvShowDetail)
        } onError: { error in
            onError(error)
        }
    }
}
