//
//  TvShowTableCell.swift
//  ApsiyonFlix
//
//  Created by Arslan Kaan AYDIN on 7.06.2022.
//

import UIKit
import SnapKit
import Kingfisher

class TvShowTableCell: UITableViewCell {
    
    // MARK: - Identifier
    enum Identifier: String {
        case custom = "cellIdentifier"
    }
    //MARK: - UI Elements
    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.appBlack
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let tvShowImage: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    private let starIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "star.fill")
        return iv
    }()
    
    private let cellRightArrow: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "arrow.right")
        iv.tintColor = Color.appWhite
        return iv
    }()
    
    private let tvShowNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        return label
    }()
    
    private let voteLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Functions
    private func configure() {
        subviews()
        drawDesign()
        makeBaseView()
        makeTvShowImage()
        makeStarIcon()
        makeCellRightArrow()
        makeTvShowNameLabel()
        makeVoteLabel()
    }
    
    private func drawDesign() {
        contentView.backgroundColor = .lightGray.withAlphaComponent(0.05)
    }
    
    private func subviews() {
        contentView.addSubview(baseView)
        contentView.addSubview(tvShowImage)
        contentView.addSubview(starIcon)
        contentView.addSubview(cellRightArrow)
        contentView.addSubview(tvShowNameLabel)
        contentView.addSubview(voteLabel)

    }
    //MARK: - Datas for Cell
    func saveTvShowModel(model: TvShowResult) {
        // Vote
        guard let vote = model.voteAverage else { return }
        voteLabel.text = "\(vote) / 10"
        
        switch true {
        case vote < 7.0:
            voteLabel.textColor = .red
            starIcon.tintColor = .red
        case vote >= 7.0 && vote < 9.0:
            voteLabel.textColor = .orange
            starIcon.tintColor = .orange
        case vote >= 9.0:
            voteLabel.textColor = .green
            starIcon.tintColor = .green
        default:
            break
        }
        // Tv Show Name
        tvShowNameLabel.text = model.name
        // Tv Show Image
        tvShowImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w1280" + (model.posterPath ?? "")))
    }
    
}
//MARK: - SnapKit Extension
extension TvShowTableCell {
    private func makeBaseView() {
        baseView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    private func makeTvShowImage() {
        tvShowImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalTo(baseView.snp.bottom).inset(15)
            make.left.equalTo(baseView.snp.left).offset(15)
            make.width.equalTo(baseView).multipliedBy(0.36)
        }
    }
    
    private func makeStarIcon() {
        starIcon.snp.makeConstraints { make in
            make.left.equalTo(tvShowImage.snp.right).offset(10)
            make.bottom.equalTo(tvShowImage.snp.bottom)
            make.height.equalTo(20)
        }
    }
    
    private func makeCellRightArrow() {
        cellRightArrow.snp.makeConstraints { make in
            make.centerY.equalTo(baseView)
            make.right.equalToSuperview().inset(25)
            make.width.equalTo(20)
        }
    }
    
    private func makeTvShowNameLabel() {
        tvShowNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(tvShowImage)
            make.left.equalTo(tvShowImage.snp.right).offset(10)
            make.right.equalTo(cellRightArrow.snp.left).inset(10)
            make.height.equalTo(100)
        }
    }
    
    private func makeVoteLabel() {
        voteLabel.snp.makeConstraints { make in
            make.left.equalTo(starIcon.snp.right).offset(5)
            make.centerY.equalTo(starIcon)
        }
    }
}
