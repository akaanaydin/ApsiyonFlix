//
//  TvShowDetailController.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 7.06.2022.
//

import UIKit
import SnapKit
import Kingfisher

class TvShowDetailController: UIViewController {

    //MARK: - Flip Animation Enums
    private enum Side {
        case head
        case tail
    }
    //MARK: - Properties
    
    // Flip Card Active Side
    private var currentSide: Side = .head
    // Data
    private var detailResults: TvShowDetailModel
    
    //MARK: - UI Elements
    private let tvShowImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.layer.borderColor = Color.appWhite.cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    private let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailView : UIView = {
        let view = UIView()
        view.backgroundColor = Color.appBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.layer.cornerRadius = 30
        view.layer.borderColor = Color.appWhite.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let voteView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = false
        view.layer.cornerRadius = 40
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 5
        return view
    }()
    
    private let voteLabel: UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let seasonsLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let episodesLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.text = """
        👆🏼
        Please touch the poster to see details
        """
        return label
    }()
    
    init(detailResults: TvShowDetailModel) {
        self.detailResults = detailResults
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Functions
    func configure() {
        addSubviews()
        drawDesign()
        tapGesture()
        makeContainerView()
        makeTvShowImage()
        makeDetailView()
        makeTitleLabel()
        makeVoteLabel()
        makeOverviewLabel()
        makeSeasonsLabel()
        makeEpisodesLabel()
        makeVoteView()
        makeInformationLabel()
    }
    // Design
    func drawDesign() {
        // View
        view.backgroundColor = Color.appBlack
        // Navigation Bar
        navigationItem.title = "Tv Show Detail"
        // Nil Control
        guard let vote = detailResults.voteAverage, let season = detailResults.numberOfSeasons, let episode = detailResults.numberOfEpisodes else { return }
        // Image
        let urlImage = URL(string: "https://image.tmdb.org/t/p/w1280" + (detailResults.posterPath ?? ""))
        tvShowImage.kf.setImage(with: urlImage)
        // Label Text
        titleLabel.text = detailResults.name
        overviewLabel.text = detailResults.overview
        // Label Multiline Text
        voteLabel.text = """
        VOTE
        \(String(describing: vote))
        """
        
        seasonsLabel.text = """
        Seasons
        \(String(describing: season))
        """
        
        episodesLabel.text = """
        Episodes
        \(String(describing: episode))
        """
        
    }
    // Subviews
    func addSubviews() {
        view.addSubview(containerView)
        view.addSubview(informationLabel)
        containerView.addSubview(tvShowImage)
        containerView.addSubview(voteView)
        containerView.addSubview(detailView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(voteLabel)
        containerView.addSubview(overviewLabel)
        containerView.addSubview(seasonsLabel)
        containerView.addSubview(episodesLabel)
        
    }
    // Tap Gesture for Flip Animation
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapContainer))
        containerView.addGestureRecognizer(tapGesture)
    }
    // Labels Visibilty Status
    func hideLabels(_ status: Bool){
        titleLabel.isHidden = status
        overviewLabel.isHidden = status
        seasonsLabel.isHidden = status
        episodesLabel.isHidden = status
    }
    
    func reverseHideLabels(_ status: Bool){
        voteLabel.isHidden = status
        voteView.isHidden = status
        informationLabel.isHidden = status
    }
    // Selector for Tap Gesture
    @objc
    func tapContainer() {
        switch currentSide {
        case .head:
            UIView.transition(from: tvShowImage,
                              to: detailView,
                              duration: 1,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
            currentSide = .tail
            hideLabels(false)
            reverseHideLabels(true)
        case .tail:
            UIView.transition(from: detailView,
                              to: tvShowImage,
                              duration: 1,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews],
                              completion: nil)
            currentSide = .head
            hideLabels(true)
            reverseHideLabels(false)
        }
    }
}
//MARK: - SnapKit Extension
extension TvShowDetailController {
    private func makeContainerView() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(200)
            
        }
    }
    
    private func makeInformationLabel() {
        informationLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(20)
            make.left.right.equalTo(containerView)
        }
    }
    
    private func makeVoteView() {
        voteView.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(10)
            make.height.width.equalTo(80)
            make.right.equalTo(containerView).inset(10)
        }
    }
    
    
    private func makeTvShowImage() {
        tvShowImage.snp.makeConstraints { make in
            make.center.equalTo(containerView)
            make.height.width.equalTo(containerView)
        }
    }
    
    private func makeDetailView() {
        detailView.snp.makeConstraints { make in
            make.center.equalTo(containerView)
            make.height.width.equalTo(containerView)
        }
    }
    
    private func makeTitleLabel() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(10)
            make.centerX.equalTo(containerView)
            make.left.equalTo(containerView).offset(10)
            make.right.equalTo(containerView).inset(10)
        }
    }
    
    private func makeVoteLabel() {
        voteLabel.snp.makeConstraints { make in
            make.center.equalTo(voteView)
        }
    }
    
    private func makeOverviewLabel() {
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.right.left.equalTo(titleLabel)
            make.centerX.equalTo(containerView)
        }
    }
    
    private func makeSeasonsLabel() {
        seasonsLabel.snp.makeConstraints { make in
            make.top.equalTo(overviewLabel.snp.bottom).offset(10)
            make.centerX.equalTo(containerView)
            make.left.right.equalTo(titleLabel)
        }
    }
    
    private func makeEpisodesLabel() {
        episodesLabel.snp.makeConstraints { make in
            make.top.equalTo(seasonsLabel.snp.bottom).offset(10)
            make.centerX.equalTo(containerView)
            make.left.right.equalTo(titleLabel)
        }
    }
    
    
}
